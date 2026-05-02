import 'package:area_and_plot/core/error/exceptions.dart';
import 'package:area_and_plot/features/area_calculator/data/models/area_calculation_hive_model.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AreaCalculatorLocalDataSource {
  Future<void> save(AreaCalculation calculation);
  Future<List<AreaCalculation>> getAll();
  Future<void> delete(String id);
  Future<void> toggleFavorite(String id, {required bool isFavorite});
}

class AreaCalculatorLocalDataSourceImpl implements AreaCalculatorLocalDataSource {
  const AreaCalculatorLocalDataSourceImpl(this._box);

  final Box<AreaCalculationHiveModel> _box;

  @override
  Future<void> save(AreaCalculation calculation) async {
    try {
      await _box.put(
          calculation.id, AreaCalculationHiveModel.fromDomain(calculation));
    } catch (e) {
      throw CacheException('Failed to save: $e');
    }
  }

  @override
  Future<List<AreaCalculation>> getAll() async {
    try {
      final sorted = _box.values.toList()
        ..sort((a, b) => b.createdAtMs.compareTo(a.createdAtMs));
      return sorted.map((m) => m.toDomain()).toList();
    } catch (e) {
      throw CacheException('Failed to fetch: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _box.delete(id);
    } catch (e) {
      throw CacheException('Failed to delete: $e');
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
      throw CacheException('Failed to update favorite: $e');
    }
  }
}
