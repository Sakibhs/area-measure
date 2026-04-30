import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/area_converter.dart';

class ConvertUnitUseCase {
  const ConvertUnitUseCase();

  double call({
    required double value,
    required AreaUnit from,
    required AreaUnit to,
  }) =>
      AreaConverter.convert(value: value, from: from, to: to);

  Map<AreaUnit, double> convertToAll({
    required double value,
    required AreaUnit from,
  }) {
    final inSqFt = value * (UnitConversionFactors.toSquareFeet[from] ?? 1.0);
    return AreaConverter.convertToAll(inSqFt);
  }
}
