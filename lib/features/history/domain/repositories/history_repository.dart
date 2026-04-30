import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';

abstract class HistoryRepository {
  Future<List<HistoryEntry>> getAll();
  Future<List<HistoryEntry>> getFavorites();
  Future<void> save(HistoryEntry entry);
  Future<void> delete(String id);
  Future<void> toggleFavorite(String id, {required bool isFavorite});
}
