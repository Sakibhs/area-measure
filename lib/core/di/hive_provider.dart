import 'package:area_and_plot/features/area_calculator/data/models/area_calculation_hive_model.dart';
import 'package:area_and_plot/features/history/data/models/history_entry_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  const HiveBoxes({
    required this.areaCalculations,
    required this.historyEntries,
  });
  final Box<AreaCalculationHiveModel> areaCalculations;
  final Box<HistoryEntryHiveModel> historyEntries;
}

final hiveBoxesProvider = FutureProvider<HiveBoxes>((ref) async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(AreaCalculationHiveModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(HistoryEntryHiveModelAdapter());
  }
  final areaBox = await Hive.openBox<AreaCalculationHiveModel>('area_calculations');
  final historyBox = await Hive.openBox<HistoryEntryHiveModel>('history_entries');
  return HiveBoxes(areaCalculations: areaBox, historyEntries: historyBox);
});
