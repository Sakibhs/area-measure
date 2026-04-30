import 'package:area_and_plot/features/history/data/datasources/history_local_datasource.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:area_and_plot/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  const HistoryRepositoryImpl(this._dataSource);

  final HistoryLocalDataSource _dataSource;

  @override
  Future<List<HistoryEntry>> getAll() => _dataSource.getAll();

  @override
  Future<List<HistoryEntry>> getFavorites() => _dataSource.getFavorites();

  @override
  Future<void> save(HistoryEntry entry) => _dataSource.save(entry);

  @override
  Future<void> delete(String id) => _dataSource.delete(id);

  @override
  Future<void> toggleFavorite(String id, {required bool isFavorite}) =>
      _dataSource.toggleFavorite(id, isFavorite: isFavorite);
}
