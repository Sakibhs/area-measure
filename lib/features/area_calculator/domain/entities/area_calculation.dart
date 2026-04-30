import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'area_calculation.freezed.dart';

enum AreaShape {
  rectangle,
  triangle,
  polygon;

  String get labelEn {
    switch (this) {
      case rectangle:
        return 'Rectangle';
      case triangle:
        return 'Triangle';
      case polygon:
        return 'Polygon';
    }
  }

  String get labelBn {
    switch (this) {
      case rectangle:
        return 'আয়তক্ষেত্র';
      case triangle:
        return 'ত্রিভুজ';
      case polygon:
        return 'বহুভুজ';
    }
  }
}

@freezed
class AreaCalculation with _$AreaCalculation {
  const factory AreaCalculation({
    required String id,
    required AreaShape shape,
    required List<double> dimensions,
    required double areaInSqFt,
    required AreaUnit displayUnit,
    required DateTime createdAt,
    @Default(false) bool isFavorite,
    String? label,
  }) = _AreaCalculation;
}
