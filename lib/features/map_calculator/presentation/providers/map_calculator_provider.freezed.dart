// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_calculator_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapCalculatorState {
  List<MapAreaPoint> get points => throw _privateConstructorUsedError;
  double get areaInSqFt => throw _privateConstructorUsedError;
  AreaUnit get displayUnit => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapCalculatorStateCopyWith<MapCalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapCalculatorStateCopyWith<$Res> {
  factory $MapCalculatorStateCopyWith(
          MapCalculatorState value, $Res Function(MapCalculatorState) then) =
      _$MapCalculatorStateCopyWithImpl<$Res, MapCalculatorState>;
  @useResult
  $Res call(
      {List<MapAreaPoint> points,
      double areaInSqFt,
      AreaUnit displayUnit,
      bool isSaving,
      String? errorMessage});
}

/// @nodoc
class _$MapCalculatorStateCopyWithImpl<$Res, $Val extends MapCalculatorState>
    implements $MapCalculatorStateCopyWith<$Res> {
  _$MapCalculatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? areaInSqFt = null,
    Object? displayUnit = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<MapAreaPoint>,
      areaInSqFt: null == areaInSqFt
          ? _value.areaInSqFt
          : areaInSqFt // ignore: cast_nullable_to_non_nullable
              as double,
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
}

/// @nodoc
abstract class _$$MapCalculatorStateImplCopyWith<$Res>
    implements $MapCalculatorStateCopyWith<$Res> {
  factory _$$MapCalculatorStateImplCopyWith(_$MapCalculatorStateImpl value,
          $Res Function(_$MapCalculatorStateImpl) then) =
      __$$MapCalculatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MapAreaPoint> points,
      double areaInSqFt,
      AreaUnit displayUnit,
      bool isSaving,
      String? errorMessage});
}

/// @nodoc
class __$$MapCalculatorStateImplCopyWithImpl<$Res>
    extends _$MapCalculatorStateCopyWithImpl<$Res, _$MapCalculatorStateImpl>
    implements _$$MapCalculatorStateImplCopyWith<$Res> {
  __$$MapCalculatorStateImplCopyWithImpl(_$MapCalculatorStateImpl _value,
      $Res Function(_$MapCalculatorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? areaInSqFt = null,
    Object? displayUnit = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$MapCalculatorStateImpl(
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<MapAreaPoint>,
      areaInSqFt: null == areaInSqFt
          ? _value.areaInSqFt
          : areaInSqFt // ignore: cast_nullable_to_non_nullable
              as double,
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

class _$MapCalculatorStateImpl implements _MapCalculatorState {
  const _$MapCalculatorStateImpl(
      {final List<MapAreaPoint> points = const [],
      this.areaInSqFt = 0.0,
      this.displayUnit = AreaUnit.katha,
      this.isSaving = false,
      this.errorMessage})
      : _points = points;

  final List<MapAreaPoint> _points;
  @override
  @JsonKey()
  List<MapAreaPoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  @JsonKey()
  final double areaInSqFt;
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
    return 'MapCalculatorState(points: $points, areaInSqFt: $areaInSqFt, displayUnit: $displayUnit, isSaving: $isSaving, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapCalculatorStateImpl &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.areaInSqFt, areaInSqFt) ||
                other.areaInSqFt == areaInSqFt) &&
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
      const DeepCollectionEquality().hash(_points),
      areaInSqFt,
      displayUnit,
      isSaving,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapCalculatorStateImplCopyWith<_$MapCalculatorStateImpl> get copyWith =>
      __$$MapCalculatorStateImplCopyWithImpl<_$MapCalculatorStateImpl>(
          this, _$identity);
}

abstract class _MapCalculatorState implements MapCalculatorState {
  const factory _MapCalculatorState(
      {final List<MapAreaPoint> points,
      final double areaInSqFt,
      final AreaUnit displayUnit,
      final bool isSaving,
      final String? errorMessage}) = _$MapCalculatorStateImpl;

  @override
  List<MapAreaPoint> get points;
  @override
  double get areaInSqFt;
  @override
  AreaUnit get displayUnit;
  @override
  bool get isSaving;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MapCalculatorStateImplCopyWith<_$MapCalculatorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
