import 'package:area_and_plot/features/history/data/datasources/history_local_datasource.dart';
import 'package:area_and_plot/features/history/data/datasources/history_remote_datasource.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:area_and_plot/features/history/domain/repositories/history_repository.dart';
import 'package:flutter/foundation.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  const HistoryRepositoryImpl(this._local, this._remote);

  final HistoryLocalDataSource _local;
  final HistoryRemoteDataSource _remote;

  @override
  Future<List<HistoryEntry>> getAll() => _local.getAll();

  @override
  Future<List<HistoryEntry>> getFavorites() => _local.getFavorites();

  @override
  Future<void> save(HistoryEntry entry) async {
    try {
      await _remote.save(entry);
    } catch (e) {
      debugPrint('Firestore save failed: $e');
    }
    await _local.save(entry);
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _remote.delete(id);
    } catch (e) {
      debugPrint('Firestore delete failed: $e');
    }
    await _local.delete(id);
  }

  @override
  Future<void> toggleFavorite(String id, {required bool isFavorite}) async {
    try {
      await _remote.updateFavorite(id, isFavorite: isFavorite);
    } catch (e) {
      debugPrint('Firestore favorite update failed: $e');
    }
    await _local.toggleFavorite(id, isFavorite: isFavorite);
  }
}
