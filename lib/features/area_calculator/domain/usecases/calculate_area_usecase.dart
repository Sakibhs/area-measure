import 'dart:math';

import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/error/exceptions.dart';
import 'package:area_and_plot/core/utils/area_converter.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:uuid/uuid.dart';

class CalculateAreaUseCase {
  const CalculateAreaUseCase();

  static const _uuid = Uuid();

  AreaCalculation call({
    required AreaShape shape,
    required List<double> dimensions,
    required AreaUnit displayUnit,
  }) {
    final areaInSqFt = _computeSqFt(shape, dimensions);
    return AreaCalculation(
      id: _uuid.v4(),
      shape: shape,
      dimensions: dimensions,
      areaInSqFt: areaInSqFt,
      displayUnit: displayUnit,
      createdAt: DateTime.now(),
    );
  }

  double _computeSqFt(AreaShape shape, List<double> dimensions) {
    switch (shape) {
      case AreaShape.rectangle:
        if (dimensions.length < 2) throw const CalculationException('Rectangle needs width and height');
        return dimensions[0] * dimensions[1];

      case AreaShape.triangle:
        if (dimensions.length < 2) throw const CalculationException('Triangle needs base and height');
        return 0.5 * dimensions[0] * dimensions[1];

      case AreaShape.polygon:
        if (dimensions.length < 6 || dimensions.length.isOdd) {
          throw const CalculationException('Polygon needs at least 3 x,y vertex pairs');
        }
        final vertices = <({double x, double y})>[];
        for (int i = 0; i < dimensions.length; i += 2) {
          vertices.add((x: dimensions[i], y: dimensions[i + 1]));
        }
        return AreaConverter.polygonAreaFromVertices(vertices);
    }
  }
}

class CalculateRectangleAreaUseCase {
  const CalculateRectangleAreaUseCase();

  double call({required double width, required double height}) {
    if (width <= 0 || height <= 0) throw const CalculationException('Dimensions must be positive');
    return width * height;
  }
}

class CalculateCircleAreaUseCase {
  const CalculateCircleAreaUseCase();

  double call({required double radius}) {
    if (radius <= 0) throw const CalculationException('Radius must be positive');
    return pi * radius * radius;
  }
}
