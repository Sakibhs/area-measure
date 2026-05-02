import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/di/hive_provider.dart';
import 'package:area_and_plot/core/error/exceptions.dart';
import 'package:area_and_plot/core/utils/area_converter.dart';
import 'package:area_and_plot/features/area_calculator/data/datasources/area_calculator_local_datasource.dart';
import 'package:area_and_plot/features/area_calculator/data/repositories/area_calculator_repository_impl.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:area_and_plot/features/area_calculator/domain/usecases/calculate_area_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'area_calculator_provider.freezed.dart';
part 'area_calculator_provider.g.dart';

@freezed
class AreaCalculatorState with _$AreaCalculatorState {
  const factory AreaCalculatorState({
    @Default(AreaShape.rectangle) AreaShape shape,
    @Default([0.0, 0.0]) List<double> dimensions,
    AreaCalculation? result,
    @Default(AreaUnit.squareFeet) AreaUnit displayUnit,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _AreaCalculatorState;
}

@riverpod
class AreaCalculatorNotifier extends _$AreaCalculatorNotifier {
  static const _useCase = CalculateAreaUseCase();

  @override
  AreaCalculatorState build() => const AreaCalculatorState();

  void setShape(AreaShape shape) {
    final defaultDims = switch (shape) {
      AreaShape.rectangle => [0.0, 0.0],
      AreaShape.triangle => [0.0, 0.0],
      AreaShape.polygon => [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    };
    state = state.copyWith(shape: shape, dimensions: defaultDims, result: null, errorMessage: null);
  }

  void setDimension(int index, double value) {
    final updated = List<double>.from(state.dimensions);
    if (index < updated.length) updated[index] = value;
    state = state.copyWith(dimensions: updated, errorMessage: null);
  }

  void addPolygonVertex() {
    if (state.dimensions.length >= 40) return; // 20 vertices max
    state = state.copyWith(dimensions: [...state.dimensions, 0.0, 0.0]);
  }

  void removePolygonVertex() {
    if (state.dimensions.length <= 6) return; // min 3 vertices
    final updated = state.dimensions.sublist(0, state.dimensions.length - 2);
    state = state.copyWith(dimensions: updated);
  }

  void setDisplayUnit(AreaUnit unit) {
    state = state.copyWith(displayUnit: unit);
  }

  void calculate() {
    try {
      final calculation = _useCase(
        shape: state.shape,
        dimensions: state.dimensions,
        displayUnit: state.displayUnit,
      );
      state = state.copyWith(result: calculation, errorMessage: null);
    } on CalculationException catch (e) {
      state = state.copyWith(errorMessage: e.message);
    }
  }

  double get displayValue {
    final result = state.result;
    if (result == null) return 0.0;
    return AreaConverter.convert(
      value: result.areaInSqFt,
      from: AreaUnit.squareFeet,
      to: state.displayUnit,
    );
  }

  Map<AreaUnit, double> get allUnitValues {
    final result = state.result;
    if (result == null) return {for (final u in AreaUnit.values) u: 0.0};
    return AreaConverter.convertToAll(result.areaInSqFt);
  }

  Future<void> saveResult() async {
    final result = state.result;
    if (result == null) return;
    state = state.copyWith(isSaving: true);
    try {
      final boxes = await ref.read(hiveBoxesProvider.future);
      final dataSource = AreaCalculatorLocalDataSourceImpl(boxes.areaCalculations);
      final repo = AreaCalculatorRepositoryImpl(dataSource);
      await repo.saveCalculation(result);
    } catch (_) {
      state = state.copyWith(errorMessage: 'Failed to save calculation');
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  void reset() {
    state = const AreaCalculatorState();
  }
}
