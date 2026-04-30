import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:isar/isar.dart';

part 'area_calculation_isar_model.g.dart';

@collection
class AreaCalculationIsarModel {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String id;

  late String shapeIndex;
  late List<double> dimensions;
  late double areaInSqFt;
  late String unitIndex;
  late DateTime createdAt;
  late bool isFavorite;
  String? label;

  AreaCalculation toDomain() => AreaCalculation(
        id: id,
        shape: AreaShape.values.firstWhere((e) => e.name == shapeIndex),
        dimensions: dimensions,
        areaInSqFt: areaInSqFt,
        displayUnit: AreaUnit.values.firstWhere((e) => e.name == unitIndex),
        createdAt: createdAt,
        isFavorite: isFavorite,
        label: label,
      );

  static AreaCalculationIsarModel fromDomain(AreaCalculation calc) {
    return AreaCalculationIsarModel()
      ..id = calc.id
      ..shapeIndex = calc.shape.name
      ..dimensions = calc.dimensions
      ..areaInSqFt = calc.areaInSqFt
      ..unitIndex = calc.displayUnit.name
      ..createdAt = calc.createdAt
      ..isFavorite = calc.isFavorite
      ..label = calc.label;
  }
}
