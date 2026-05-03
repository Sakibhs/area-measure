import 'dart:async';

import 'package:area_and_plot/core/di/hive_provider.dart';
import 'package:area_and_plot/features/history/data/datasources/history_local_datasource.dart';
import 'package:area_and_plot/features/history/data/datasources/history_remote_datasource.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_provider.g.dart';

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  StreamSubscription<List<HistoryEntry>>? _sub;
  HistoryLocalDataSourceImpl? _local;
  HistoryRemoteDataSourceImpl? _remote;

  @override
  Future<List<HistoryEntry>> build() async {
    ref.onDispose(() => _sub?.cancel());

    final boxes = await ref.watch(hiveBoxesProvider.future);
    _local = HistoryLocalDataSourceImpl(boxes.historyEntries);
    _remote = HistoryRemoteDataSourceImpl(
      FirebaseFirestore.instance,
      FirebaseAuth.instance,
    );

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      _sub?.cancel();
      _sub = _remote!.watchAll().listen(
        (entries) async {
          try {
            await _local!.replaceAll(entries);
            state = AsyncData(entries);
          } catch (e) {
            debugPrint('History cache update failed: $e');
          }
        },
        onError: (e) => debugPrint('Firestore stream error: $e'),
      );
    }

    return _local!.getAll();
  }

  Future<void> sync() async {
    final remote = _remote;
    final local = _local;
    if (remote == null || local == null) return;
    try {
      final entries = await remote.fetchAll();
      await local.replaceAll(entries);
      state = AsyncData(entries);
    } catch (e) {
      debugPrint('History sync failed: $e');
    }
  }

  Future<void> delete(String id) async {
    final local = _local;
    if (local == null) return;
    try {
      await _remote?.delete(id);
    } catch (e) {
      debugPrint('Firestore delete failed: $e');
    }
    await local.delete(id);
    state = AsyncData(await local.getAll());
  }

  Future<void> toggleFavorite(String id, {required bool isFavorite}) async {
    final local = _local;
    if (local == null) return;
    try {
      await _remote?.updateFavorite(id, isFavorite: isFavorite);
    } catch (e) {
      debugPrint('Firestore favorite update failed: $e');
    }
    await local.toggleFavorite(id, isFavorite: isFavorite);
    state = AsyncData(await local.getAll());
  }
}

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  Future<List<HistoryEntry>> build() async {
    final all = await ref.watch(historyNotifierProvider.future);
    return all.where((e) => e.isFavorite).toList();
  }
}
