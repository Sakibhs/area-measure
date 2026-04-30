// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_calculator_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AreaCalculatorState {
  AreaShape get shape => throw _privateConstructorUsedError;
  List<double> get dimensions => throw _privateConstructorUsedError;
  AreaCalculation? get result => throw _privateConstructorUsedError;
  AreaUnit get displayUnit => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AreaCalculatorStateCopyWith<AreaCalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaCalculatorStateCopyWith<$Res> {
  factory $AreaCalculatorStateCopyWith(
          AreaCalculatorState value, $Res Function(AreaCalculatorState) then) =
      _$AreaCalculatorStateCopyWithImpl<$Res, AreaCalculatorState>;
  @useResult
  $Res call(
      {AreaShape shape,
      List<double> dimensions,
      AreaCalculation? result,
      AreaUnit displayUnit,
      bool isSaving,
      String? errorMessage});

  $AreaCalculationCopyWith<$Res>? get result;
}

/// @nodoc
class _$AreaCalculatorStateCopyWithImpl<$Res, $Val extends AreaCalculatorState>
    implements $AreaCalculatorStateCopyWith<$Res> {
  _$AreaCalculatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shape = null,
    Object? dimensions = null,
    Object? result = freezed,
    Object? displayUnit = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as AreaShape,
      dimensions: null == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AreaCalculation?,
      displayUnit: null == displayUnit
          ? _value.displayUnit
          : displayUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AreaCalculationCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $AreaCalculationCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AreaCalculatorStateImplCopyWith<$Res>
    implements $AreaCalculatorStateCopyWith<$Res> {
  factory _$$AreaCalculatorStateImplCopyWith(_$AreaCalculatorStateImpl value,
          $Res Function(_$AreaCalculatorStateImpl) then) =
      __$$AreaCalculatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AreaShape shape,
      List<double> dimensions,
      AreaCalculation? result,
      AreaUnit displayUnit,
      bool isSaving,
      String? errorMessage});

  @override
  $AreaCalculationCopyWith<$Res>? get result;
}

/// @nodoc
class __$$AreaCalculatorStateImplCopyWithImpl<$Res>
    extends _$AreaCalculatorStateCopyWithImpl<$Res, _$AreaCalculatorStateImpl>
    implements _$$AreaCalculatorStateImplCopyWith<$Res> {
  __$$AreaCalculatorStateImplCopyWithImpl(_$AreaCalculatorStateImpl _value,
      $Res Function(_$AreaCalculatorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shape = null,
    Object? dimensions = null,
    Object? result = freezed,
    Object? displayUnit = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AreaCalculatorStateImpl(
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as AreaShape,
      dimensions: null == dimensions
          ? _value._dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AreaCalculation?,
      displayUnit: null == displayUnit
          ? _value.displayUnit
          : displayUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AreaCalculatorStateImpl implements _AreaCalculatorState {
  const _$AreaCalculatorStateImpl(
      {this.shape = AreaShape.rectangle,
      final List<double> dimensions = const [0.0, 0.0],
      this.result,
      this.displayUnit = AreaUnit.squareFeet,
      this.isSaving = false,
      this.errorMessage})
      : _dimensions = dimensions;

  @override
  @JsonKey()
  final AreaShape shape;
  final List<double> _dimensions;
  @override
  @JsonKey()
  List<double> get dimensions {
    if (_dimensions is EqualUnmodifiableListView) return _dimensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dimensions);
  }

  @override
  final AreaCalculation? result;
  @override
  @JsonKey()
  final AreaUnit displayUnit;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AreaCalculatorState(shape: $shape, dimensions: $dimensions, result: $result, displayUnit: $displayUnit, isSaving: $isSaving, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaCalculatorStateImpl &&
            (identical(other.shape, shape) || other.shape == shape) &&
            const DeepCollectionEquality()
                .equals(other._dimensions, _dimensions) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.displayUnit, displayUnit) ||
                other.displayUnit == displayUnit) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      shape,
      const DeepCollectionEquality().hash(_dimensions),
      result,
      displayUnit,
      isSaving,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaCalculatorStateImplCopyWith<_$AreaCalculatorStateImpl> get copyWith =>
      __$$AreaCalculatorStateImplCopyWithImpl<_$AreaCalculatorStateImpl>(
          this, _$identity);
}

abstract class _AreaCalculatorState implements AreaCalculatorState {
  const factory _AreaCalculatorState(
      {final AreaShape shape,
      final List<double> dimensions,
      final AreaCalculation? result,
      final AreaUnit displayUnit,
      final bool isSaving,
      final String? errorMessage}) = _$AreaCalculatorStateImpl;

  @override
  AreaShape get shape;
  @override
  List<double> get dimensions;
  @override
  AreaCalculation? get result;
  @override
  AreaUnit get displayUnit;
  @override
  bool get isSaving;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AreaCalculatorStateImplCopyWith<_$AreaCalculatorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
