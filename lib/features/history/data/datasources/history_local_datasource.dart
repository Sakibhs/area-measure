import 'package:area_and_plot/core/error/exceptions.dart';
import 'package:area_and_plot/features/history/data/models/history_entry_isar_model.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:isar/isar.dart';

abstract class HistoryLocalDataSource {
  Future<List<HistoryEntry>> getAll();
  Future<List<HistoryEntry>> getFavorites();
  Future<void> save(HistoryEntry entry);
  Future<void> delete(String id);
  Future<void> toggleFavorite(String id, {required bool isFavorite});
}

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  const HistoryLocalDataSourceImpl(this._isar);

  final Isar _isar;

  @override
  Future<List<HistoryEntry>> getAll() async {
    try {
      final models = await _isar.historyEntryIsarModels
          .where()
          .sortByCreatedAtDesc()
          .findAll();
      return models.map((m) => m.toDomain()).toList();
    } catch (e) {
      throw CacheException('Failed to fetch history: $e');
    }
  }

  @override
  Future<List<HistoryEntry>> getFavorites() async {
    try {
      final models = await _isar.historyEntryIsarModels
          .filter()
          .isFavoriteEqualTo(true)
          .sortByCreatedAtDesc()
          .findAll();
      return models.map((m) => m.toDomain()).toList();
    } catch (e) {
      throw CacheException('Failed to fetch favorites: $e');
    }
  }

  @override
  Future<void> save(HistoryEntry entry) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.historyEntryIsarModels
            .putByIndex('id', HistoryEntryIsarModel.fromDomain(entry));
      });
    } catch (e) {
      throw CacheException('Failed to save history: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.historyEntryIsarModels.deleteByIndex('id', [id]);
      });
    } catch (e) {
      throw CacheException('Failed to delete entry: $e');
    }
  }

  @override
  Future<void> toggleFavorite(String id, {required bool isFavorite}) async {
    try {
      await _isar.writeTxn(() async {
        final model =
            await _isar.historyEntryIsarModels.getByIndex('id', [id]);
        if (model != null) {
          model.isFavorite = isFavorite;
          await _isar.historyEntryIsarModels.put(model);
        }
      });
    } catch (e) {
      throw CacheException('Failed to toggle favorite: $e');
    }
  }
}
