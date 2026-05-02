import 'package:area_and_plot/core/error/exceptions.dart';
import 'package:area_and_plot/features/history/data/models/history_entry_hive_model.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HistoryLocalDataSource {
  Future<List<HistoryEntry>> getAll();
  Future<List<HistoryEntry>> getFavorites();
  Future<void> save(HistoryEntry entry);
  Future<void> delete(String id);
  Future<void> toggleFavorite(String id, {required bool isFavorite});
}

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  const HistoryLocalDataSourceImpl(this._box);

  final Box<HistoryEntryHiveModel> _box;

  @override
  Future<List<HistoryEntry>> getAll() async {
    try {
      final sorted = _box.values.toList()
        ..sort((a, b) => b.createdAtMs.compareTo(a.createdAtMs));
      return sorted.map((m) => m.toDomain()).toList();
    } catch (e) {
      throw CacheException('Failed to fetch history: $e');
    }
  }

  @override
  Future<List<HistoryEntry>> getFavorites() async {
    try {
      final sorted = _box.values
          .where((m) => m.isFavorite)
          .toList()
        ..sort((a, b) => b.createdAtMs.compareTo(a.createdAtMs));
      return sorted.map((m) => m.toDomain()).toList();
    } catch (e) {
      throw CacheException('Failed to fetch favorites: $e');
    }
  }

  @override
  Future<void> save(HistoryEntry entry) async {
    try {
      await _box.put(entry.id, HistoryEntryHiveModel.fromDomain(entry));
    } catch (e) {
      throw CacheException('Failed to save history: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _box.delete(id);
    } catch (e) {
      throw CacheException('Failed to delete entry: $e');
    }
  }

  @override
  Future<void> toggleFavorite(String id, {required bool isFavorite}) async {
    try {
      final model = _box.get(id);
      if (model == null) return;
      model.isFavorite = isFavorite;
      await _box.put(id, model);
    } catch (e) {
      throw CacheException('Failed to toggle favorite: $e');
    }
  }
}
