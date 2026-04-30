import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:isar/isar.dart';

part 'history_entry_isar_model.g.dart';

@collection
class HistoryEntryIsarModel {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String id;

  late String typeIndex;
  late double areaInSqFt;
  late String unitIndex;
  late DateTime createdAt;
  late bool isFavorite;
  String? label;
  String? shapeIndex;
  List<double>? dimensions;
  int? mapPointCount;

  HistoryEntry toDomain() => HistoryEntry(
        id: id,
        type: HistoryType.values.firstWhere((e) => e.name == typeIndex),
        areaInSqFt: areaInSqFt,
        displayUnit: AreaUnit.values.firstWhere((e) => e.name == unitIndex),
        createdAt: createdAt,
        isFavorite: isFavorite,
        label: label,
        shape: shapeIndex != null
            ? AreaShape.values.firstWhere((e) => e.name == shapeIndex)
            : null,
        dimensions: dimensions,
        mapPointCount: mapPointCount,
      );

  static HistoryEntryIsarModel fromDomain(HistoryEntry entry) {
    return HistoryEntryIsarModel()
      ..id = entry.id
      ..typeIndex = entry.type.name
      ..areaInSqFt = entry.areaInSqFt
      ..unitIndex = entry.displayUnit.name
      ..createdAt = entry.createdAt
      ..isFavorite = entry.isFavorite
      ..label = entry.label
      ..shapeIndex = entry.shape?.name
      ..dimensions = entry.dimensions
      ..mapPointCount = entry.mapPointCount;
  }
}
