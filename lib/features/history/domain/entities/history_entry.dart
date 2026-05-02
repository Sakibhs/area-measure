import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_entry.freezed.dart';

enum HistoryType { areaCalculator, mapCalculator }

@freezed
class HistoryEntry with _$HistoryEntry {
  const factory HistoryEntry({
    required String id,
    required HistoryType type,
    required double areaInSqFt,
    required AreaUnit displayUnit,
    required DateTime createdAt,
    @Default(false) bool isFavorite,
    String? label,
    AreaShape? shape,
    List<double>? dimensions,
    int? mapPointCount,
    List<double>? mapPoints,
  }) = _HistoryEntry;
}
