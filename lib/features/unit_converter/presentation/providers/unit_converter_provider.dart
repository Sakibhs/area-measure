import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/features/unit_converter/domain/usecases/convert_unit_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unit_converter_provider.freezed.dart';
part 'unit_converter_provider.g.dart';

@freezed
class UnitConverterState with _$UnitConverterState {
  const factory UnitConverterState({
    @Default(0.0) double inputValue,
    @Default(AreaUnit.squareFeet) AreaUnit fromUnit,
    @Default(AreaUnit.katha) AreaUnit toUnit,
    @Default({}) Map<AreaUnit, double> allResults,
  }) = _UnitConverterState;
}

@riverpod
class UnitConverterNotifier extends _$UnitConverterNotifier {
  static const _useCase = ConvertUnitUseCase();

  @override
  UnitConverterState build() => const UnitConverterState();

  void setInputValue(double value) {
    final results = _useCase.convertToAll(value: value, from: state.fromUnit);
    state = state.copyWith(inputValue: value, allResults: results);
  }

  void setFromUnit(AreaUnit unit) {
    final results = _useCase.convertToAll(value: state.inputValue, from: unit);
    state = state.copyWith(fromUnit: unit, allResults: results);
  }

  void setToUnit(AreaUnit unit) {
    state = state.copyWith(toUnit: unit);
  }

  double get singleResult => _useCase(
        value: state.inputValue,
        from: state.fromUnit,
        to: state.toUnit,
      );
}
