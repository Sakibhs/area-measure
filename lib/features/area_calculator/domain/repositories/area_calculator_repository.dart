import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';

abstract class AreaCalculatorRepository {
  Future<void> saveCalculation(AreaCalculation calculation);
  Future<List<AreaCalculation>> getCalculations();
  Future<void> deleteCalculation(String id);
  Future<void> toggleFavorite(String id, {required bool isFavorite});
}
