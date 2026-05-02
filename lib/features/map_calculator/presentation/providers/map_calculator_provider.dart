import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/di/hive_provider.dart';
import 'package:area_and_plot/core/utils/area_converter.dart';
import 'package:area_and_plot/features/history/data/datasources/history_local_datasource.dart';
import 'package:area_and_plot/features/history/data/repositories/history_repository_impl.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:area_and_plot/features/map_calculator/domain/entities/map_area_point.dart';
import 'package:area_and_plot/features/map_calculator/domain/usecases/calculate_polygon_area_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'map_calculator_provider.freezed.dart';
part 'map_calculator_provider.g.dart';

@freezed
class MapCalculatorState with _$MapCalculatorState {
  const factory MapCalculatorState({
    @Default([]) List<MapAreaPoint> points,
    @Default(0.0) double areaInSqFt,
    @Default(AreaUnit.katha) AreaUnit displayUnit,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _MapCalculatorState;
}

@riverpod
class MapCalculatorNotifier extends _$MapCalculatorNotifier {
  static const _useCase = CalculatePolygonAreaUseCase();
  static const _uuid = Uuid();

  @override
  MapCalculatorState build() => const MapCalculatorState();

  void addPoint(MapAreaPoint point) {
    final updated = [...state.points, point];
    final area = _useCase(updated);
    state = state.copyWith(points: updated, areaInSqFt: area);
  }

  void undoLastPoint() {
    if (state.points.isEmpty) return;
    final updated = state.points.sublist(0, state.points.length - 1);
    final area = _useCase(updated);
    state = state.copyWith(points: updated, areaInSqFt: area);
  }

  void movePoint(int index, MapAreaPoint newPoint) {
    if (index < 0 || index >= state.points.length) return;
    final updated = List<MapAreaPoint>.from(state.points)..[index] = newPoint;
    state = state.copyWith(points: updated, areaInSqFt: _useCase(updated));
  }

  void clearPoints() {
    state = const MapCalculatorState();
  }

  void setDisplayUnit(AreaUnit unit) {
    state = state.copyWith(displayUnit: unit);
  }

  double get displayValue => AreaConverter.convert(
        value: state.areaInSqFt,
        from: AreaUnit.squareFeet,
        to: state.displayUnit,
      );

  Map<AreaUnit, double> get allValues =>
      AreaConverter.convertToAll(state.areaInSqFt);

  Future<void> saveToHistory() async {
    if (state.points.length < 3) {
      state = state.copyWith(errorMessage: 'কমপক্ষে ৩টি বিন্দু প্রয়োজন');
      return;
    }
    state = state.copyWith(isSaving: true, errorMessage: null);
    try {
      final entry = HistoryEntry(
        id: _uuid.v4(),
        type: HistoryType.mapCalculator,
        areaInSqFt: state.areaInSqFt,
        displayUnit: state.displayUnit,
        createdAt: DateTime.now(),
        mapPointCount: state.points.length,
      );
      final boxes = await ref.read(hiveBoxesProvider.future);
      final repo = HistoryRepositoryImpl(HistoryLocalDataSourceImpl(boxes.historyEntries));
      await repo.save(entry);
    } catch (_) {
      state = state.copyWith(errorMessage: 'সংরক্ষণ ব্যর্থ হয়েছে');
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }
}
