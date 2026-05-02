import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryEntryHiveModel {
  HistoryEntryHiveModel({
    required this.id,
    required this.typeIndex,
    required this.areaInSqFt,
    required this.unitIndex,
    required this.createdAtMs,
    required this.isFavorite,
    this.label,
    this.shapeIndex,
    this.dimensions,
    this.mapPointCount,
  });

  final String id;
  final String typeIndex;
  final double areaInSqFt;
  final String unitIndex;
  final int createdAtMs;
  bool isFavorite;
  final String? label;
  final String? shapeIndex;
  final List<double>? dimensions;
  final int? mapPointCount;

  HistoryEntry toDomain() => HistoryEntry(
        id: id,
        type: HistoryType.values.firstWhere((e) => e.name == typeIndex),
        areaInSqFt: areaInSqFt,
        displayUnit: AreaUnit.values.firstWhere((e) => e.name == unitIndex),
        createdAt: DateTime.fromMillisecondsSinceEpoch(createdAtMs),
        isFavorite: isFavorite,
        label: label,
        shape: shapeIndex != null
            ? AreaShape.values.firstWhere((e) => e.name == shapeIndex)
            : null,
        dimensions: dimensions,
        mapPointCount: mapPointCount,
      );

  static HistoryEntryHiveModel fromDomain(HistoryEntry entry) =>
      HistoryEntryHiveModel(
        id: entry.id,
        typeIndex: entry.type.name,
        areaInSqFt: entry.areaInSqFt,
        unitIndex: entry.displayUnit.name,
        createdAtMs: entry.createdAt.millisecondsSinceEpoch,
        isFavorite: entry.isFavorite,
        label: entry.label,
        shapeIndex: entry.shape?.name,
        dimensions: entry.dimensions,
        mapPointCount: entry.mapPointCount,
      );
}

class HistoryEntryHiveModelAdapter extends TypeAdapter<HistoryEntryHiveModel> {
  @override
  final int typeId = 1;

  @override
  HistoryEntryHiveModel read(BinaryReader reader) {
    final count = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < count; i++) reader.readByte(): reader.read(),
    };
    return HistoryEntryHiveModel(
      id: fields[0] as String,
      typeIndex: fields[1] as String,
      areaInSqFt: (fields[2] as num).toDouble(),
      unitIndex: fields[3] as String,
      createdAtMs: fields[4] as int,
      isFavorite: fields[5] as bool,
      label: fields[6] as String?,
      shapeIndex: fields[7] as String?,
      dimensions: (fields[8] as List?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      mapPointCount: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryEntryHiveModel obj) {
    writer.writeByte(10);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.typeIndex);
    writer.writeByte(2);
    writer.write(obj.areaInSqFt);
    writer.writeByte(3);
    writer.write(obj.unitIndex);
    writer.writeByte(4);
    writer.write(obj.createdAtMs);
    writer.writeByte(5);
    writer.write(obj.isFavorite);
    writer.writeByte(6);
    writer.write(obj.label);
    writer.writeByte(7);
    writer.write(obj.shapeIndex);
    writer.writeByte(8);
    writer.write(obj.dimensions);
    writer.writeByte(9);
    writer.write(obj.mapPointCount);
  }
}
