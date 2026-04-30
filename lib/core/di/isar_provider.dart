import 'package:area_and_plot/features/area_calculator/data/models/area_calculation_isar_model.dart';
import 'package:area_and_plot/features/history/data/models/history_entry_isar_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(IsarRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [
      AreaCalculationIsarModelSchema,
      HistoryEntryIsarModelSchema,
    ],
    directory: dir.path,
  );
}
