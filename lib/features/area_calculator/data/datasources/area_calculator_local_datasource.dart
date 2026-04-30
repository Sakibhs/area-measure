import 'package:area_and_plot/core/error/exceptions.dart';
import 'package:area_and_plot/features/area_calculator/data/models/area_calculation_isar_model.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:isar/isar.dart';

abstract class AreaCalculatorLocalDataSource {
  Future<void> save(AreaCalculation calculation);
  Future<List<AreaCalculation>> getAll();
  Future<void> delete(String id);
  Future<void> toggleFavorite(String id, {required bool isFavorite});
}

class AreaCalculatorLocalDataSourceImpl implements AreaCalculatorLocalDataSource {
  const AreaCalculatorLocalDataSourceImpl(this._isar);

  final Isar _isar;

  @override
  Future<void> save(AreaCalculation calculation) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.areaCalculationIsarModels
            .putByIndex('id', AreaCalculationIsarModel.fromDomain(calculation));
      });
    } catch (e) {
      throw CacheException('Failed to save: $e');
    }
  }

  @override
  Future<List<AreaCalculation>> getAll() async {
    try {
      final models = await _isar.areaCalculationIsarModels
          .where()
          .sortByCreatedAtDesc()
          .findAll();
      return models.map((m) => m.toDomain()).toList();
    } catch (e) {
      throw CacheException('Failed to fetch: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.areaCalculationIsarModels.deleteByIndex('id', [id]);
      });
    } catch (e) {
      throw CacheException('Failed to delete: $e');
    }
  }

  @override
  Future<void> toggleFavorite(String id, {required bool isFavorite}) async {
    try {
      await _isar.writeTxn(() async {
        final model = await _isar.areaCalculationIsarModels.getByIndex('id', [id]);
        if (model != null) {
          model.isFavorite = isFavorite;
          await _isar.areaCalculationIsarModels.put(model);
        }
      });
    } catch (e) {
      throw CacheException('Failed to update favorite: $e');
    }
  }
}
