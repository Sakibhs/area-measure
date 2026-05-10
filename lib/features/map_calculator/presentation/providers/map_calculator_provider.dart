import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/di/hive_provider.dart';
import 'package:area_and_plot/core/utils/area_converter.dart';
import 'package:area_and_plot/features/history/data/datasources/history_local_datasource.dart';
import 'package:area_and_plot/features/history/data/datasources/history_remote_datasource.dart';
import 'package:area_and_plot/features/history/data/repositories/history_repository_impl.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:area_and_plot/features/map_calculator/domain/entities/map_area_point.dart';
import 'package:area_and_plot/features/map_calculator/domain/usecases/calculate_polygon_area_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'map_calculator_provider.freezed.dart';
part 'map_calculator_provider.g.dart';

enum MeasureMode { area, distance }

@freezed
class MapCalculatorState with _$MapCalculatorState {
  const factory MapCalculatorState({
    @Default([]) List<MapAreaPoint> points,
    @Default(0.0) double areaInSqFt,
    @Default(AreaUnit.katha) AreaUnit displayUnit,
    @Default(false) bool isSaving,
    @Default(true) bool showSavedAreas,
    MeasureMode? mode,
    String? errorMessage,
  }) = _MapCalculatorState;
}

@riverpod
class MapCalculatorNotifier extends _$MapCalculatorNotifier {
  static const _useCase = CalculatePolygonAreaUseCase();
  static const _uuid = Uuid();
  static const _distanceCalc = Distance();

  @override
  MapCalculatorState build() => const MapCalculatorState();

  void setMode(MeasureMode mode) {
    state = state.copyWith(
      mode: mode,
      points: const [],
      areaInSqFt: 0.0,
      errorMessage: null,
    );
  }

  void addPoint(MapAreaPoint point) {
    if (state.mode == null) return;
    if (state.mode == MeasureMode.area && state.points.length >= 3) return;
    final updated = [...state.points, point];
    final area = state.mode == MeasureMode.area ? _useCase(updated) : 0.0;
    state = state.copyWith(points: updated, areaInSqFt: area);
  }

  void undoLastPoint() {
    if (state.points.isEmpty) return;
    final updated = state.points.sublist(0, state.points.length - 1);
    final area = state.mode == MeasureMode.area ? _useCase(updated) : 0.0;
    state = state.copyWith(points: updated, areaInSqFt: area);
  }

  void movePoint(int index, MapAreaPoint newPoint) {
    if (index < 0 || index >= state.points.length) return;
    final updated = List<MapAreaPoint>.from(state.points)..[index] = newPoint;
    final area = state.mode == MeasureMode.area ? _useCase(updated) : 0.0;
    state = state.copyWith(points: updated, areaInSqFt: area);
  }

  void insertPoint(int afterIndex, MapAreaPoint point) {
    final updated = List<MapAreaPoint>.from(state.points)
      ..insert(afterIndex + 1, point);
    final area = state.mode == MeasureMode.area ? _useCase(updated) : 0.0;
    state = state.copyWith(points: updated, areaInSqFt: area);
  }

  void clearPoints() {
    state = state.copyWith(
      points: const [],
      areaInSqFt: 0.0,
      errorMessage: null,
      mode: null,
    );
  }

  void setDisplayUnit(AreaUnit unit) {
    state = state.copyWith(displayUnit: unit);
  }

  void toggleSavedAreas() {
    state = state.copyWith(showSavedAreas: !state.showSavedAreas);
  }

  double get displayValue => AreaConverter.convert(
        value: state.areaInSqFt,
        from: AreaUnit.squareFeet,
        to: state.displayUnit,
      );

  Map<AreaUnit, double> get allValues =>
      AreaConverter.convertToAll(state.areaInSqFt);

  double get totalDistanceMeters {
    final pts = state.points;
    if (pts.length < 2) return 0.0;
    double sum = 0.0;
    for (int i = 0; i < pts.length - 1; i++) {
      sum += _distanceCalc.as(
        LengthUnit.Meter,
        LatLng(pts[i].latitude, pts[i].longitude),
        LatLng(pts[i + 1].latitude, pts[i + 1].longitude),
      );
    }
    return sum;
  }

  Future<bool> saveToHistory({
    String? label,
    String? notes,
    required AreaUnit displayUnit,
  }) async {
    final mode = state.mode;
    if (mode == null) return false;
    final minPoints = mode == MeasureMode.area ? 3 : 2;
    if (state.points.length < minPoints) return false;

    state = state.copyWith(isSaving: true, errorMessage: null);
    var success = false;
    try {
      final entry = HistoryEntry(
        id: _uuid.v4(),
        type: mode == MeasureMode.area
            ? HistoryType.mapCalculator
            : HistoryType.mapDistance,
        areaInSqFt: mode == MeasureMode.area ? state.areaInSqFt : 0.0,
        displayUnit: mode == MeasureMode.area ? displayUnit : AreaUnit.squareMeter,
        createdAt: DateTime.now(),
        label: label,
        notes: notes,
        mapPointCount: state.points.length,
        mapPoints: state.points
            .expand((p) => [p.latitude, p.longitude])
            .toList(),
      );
      final boxes = await ref.read(hiveBoxesProvider.future);
      final local = HistoryLocalDataSourceImpl(boxes.historyEntries);
      final remote = HistoryRemoteDataSourceImpl(
        FirebaseFirestore.instance,
        FirebaseAuth.instance,
      );
      final repo = HistoryRepositoryImpl(local, remote);
      await repo.save(entry);
      success = true;
    } catch (_) {
      state = state.copyWith(errorMessage: 'সংরক্ষণ ব্যর্থ হয়েছে');
    } finally {
      state = state.copyWith(isSaving: false);
      if (success) clearPoints();
    }
    return success;
  }
}
