import 'package:area_and_plot/core/di/hive_provider.dart';
import 'package:area_and_plot/features/history/data/datasources/history_local_datasource.dart';
import 'package:area_and_plot/features/history/data/repositories/history_repository_impl.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_provider.g.dart';

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  Future<List<HistoryEntry>> build() async {
    final boxes = await ref.watch(hiveBoxesProvider.future);
    final repo = HistoryRepositoryImpl(HistoryLocalDataSourceImpl(boxes.historyEntries));
    return repo.getAll();
  }

  Future<void> delete(String id) async {
    final boxes = await ref.read(hiveBoxesProvider.future);
    final repo = HistoryRepositoryImpl(HistoryLocalDataSourceImpl(boxes.historyEntries));
    await repo.delete(id);
    ref.invalidateSelf();
  }

  Future<void> toggleFavorite(String id, {required bool isFavorite}) async {
    final boxes = await ref.read(hiveBoxesProvider.future);
    final repo = HistoryRepositoryImpl(HistoryLocalDataSourceImpl(boxes.historyEntries));
    await repo.toggleFavorite(id, isFavorite: isFavorite);
    ref.invalidateSelf();
  }
}

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  Future<List<HistoryEntry>> build() async {
    final boxes = await ref.watch(hiveBoxesProvider.future);
    final repo = HistoryRepositoryImpl(HistoryLocalDataSourceImpl(boxes.historyEntries));
    return repo.getFavorites();
  }
}
