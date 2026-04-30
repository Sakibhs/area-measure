import 'package:area_and_plot/features/area_calculator/data/datasources/area_calculator_local_datasource.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:area_and_plot/features/area_calculator/domain/repositories/area_calculator_repository.dart';

class AreaCalculatorRepositoryImpl implements AreaCalculatorRepository {
  const AreaCalculatorRepositoryImpl(this._dataSource);

  final AreaCalculatorLocalDataSource _dataSource;

  @override
  Future<void> saveCalculation(AreaCalculation calculation) =>
      _dataSource.save(calculation);

  @override
  Future<List<AreaCalculation>> getCalculations() => _dataSource.getAll();

  @override
  Future<void> deleteCalculation(String id) => _dataSource.delete(id);

  @override
  Future<void> toggleFavorite(String id, {required bool isFavorite}) =>
      _dataSource.toggleFavorite(id, isFavorite: isFavorite);
}
