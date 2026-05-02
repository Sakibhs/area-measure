import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AreaCalculationHiveModel {
  AreaCalculationHiveModel({
    required this.id,
    required this.shapeIndex,
    required this.dimensions,
    required this.areaInSqFt,
    required this.unitIndex,
    required this.createdAtMs,
    required this.isFavorite,
    this.label,
  });

  final String id;
  final String shapeIndex;
  final List<double> dimensions;
  final double areaInSqFt;
  final String unitIndex;
  final int createdAtMs;
  bool isFavorite;
  final String? label;

  AreaCalculation toDomain() => AreaCalculation(
        id: id,
        shape: AreaShape.values.firstWhere((e) => e.name == shapeIndex),
        dimensions: dimensions,
        areaInSqFt: areaInSqFt,
        displayUnit: AreaUnit.values.firstWhere((e) => e.name == unitIndex),
        createdAt: DateTime.fromMillisecondsSinceEpoch(createdAtMs),
        isFavorite: isFavorite,
        label: label,
      );

  static AreaCalculationHiveModel fromDomain(AreaCalculation calc) =>
      AreaCalculationHiveModel(
        id: calc.id,
        shapeIndex: calc.shape.name,
        dimensions: calc.dimensions,
        areaInSqFt: calc.areaInSqFt,
        unitIndex: calc.displayUnit.name,
        createdAtMs: calc.createdAt.millisecondsSinceEpoch,
        isFavorite: calc.isFavorite,
        label: calc.label,
      );
}

class AreaCalculationHiveModelAdapter
    extends TypeAdapter<AreaCalculationHiveModel> {
  @override
  final int typeId = 0;

  @override
  AreaCalculationHiveModel read(BinaryReader reader) {
    final count = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < count; i++) reader.readByte(): reader.read(),
    };
    return AreaCalculationHiveModel(
      id: fields[0] as String,
      shapeIndex: fields[1] as String,
      dimensions:
          (fields[2] as List).map((e) => (e as num).toDouble()).toList(),
      areaInSqFt: (fields[3] as num).toDouble(),
      unitIndex: fields[4] as String,
      createdAtMs: fields[5] as int,
      isFavorite: fields[6] as bool,
      label: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AreaCalculationHiveModel obj) {
    writer.writeByte(8);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.shapeIndex);
    writer.writeByte(2);
    writer.write(obj.dimensions);
    writer.writeByte(3);
    writer.write(obj.areaInSqFt);
    writer.writeByte(4);
    writer.write(obj.unitIndex);
    writer.writeByte(5);
    writer.write(obj.createdAtMs);
    writer.writeByte(6);
    writer.write(obj.isFavorite);
    writer.writeByte(7);
    writer.write(obj.label);
  }
}
