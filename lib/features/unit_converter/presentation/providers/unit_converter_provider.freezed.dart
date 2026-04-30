// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_converter_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UnitConverterState {
  double get inputValue => throw _privateConstructorUsedError;
  AreaUnit get fromUnit => throw _privateConstructorUsedError;
  AreaUnit get toUnit => throw _privateConstructorUsedError;
  Map<AreaUnit, double> get allResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnitConverterStateCopyWith<UnitConverterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitConverterStateCopyWith<$Res> {
  factory $UnitConverterStateCopyWith(
          UnitConverterState value, $Res Function(UnitConverterState) then) =
      _$UnitConverterStateCopyWithImpl<$Res, UnitConverterState>;
  @useResult
  $Res call(
      {double inputValue,
      AreaUnit fromUnit,
      AreaUnit toUnit,
      Map<AreaUnit, double> allResults});
}

/// @nodoc
class _$UnitConverterStateCopyWithImpl<$Res, $Val extends UnitConverterState>
    implements $UnitConverterStateCopyWith<$Res> {
  _$UnitConverterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputValue = null,
    Object? fromUnit = null,
    Object? toUnit = null,
    Object? allResults = null,
  }) {
    return _then(_value.copyWith(
      inputValue: null == inputValue
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as double,
      fromUnit: null == fromUnit
          ? _value.fromUnit
          : fromUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      toUnit: null == toUnit
          ? _value.toUnit
          : toUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      allResults: null == allResults
          ? _value.allResults
          : allResults // ignore: cast_nullable_to_non_nullable
              as Map<AreaUnit, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitConverterStateImplCopyWith<$Res>
    implements $UnitConverterStateCopyWith<$Res> {
  factory _$$UnitConverterStateImplCopyWith(_$UnitConverterStateImpl value,
          $Res Function(_$UnitConverterStateImpl) then) =
      __$$UnitConverterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double inputValue,
      AreaUnit fromUnit,
      AreaUnit toUnit,
      Map<AreaUnit, double> allResults});
}

/// @nodoc
class __$$UnitConverterStateImplCopyWithImpl<$Res>
    extends _$UnitConverterStateCopyWithImpl<$Res, _$UnitConverterStateImpl>
    implements _$$UnitConverterStateImplCopyWith<$Res> {
  __$$UnitConverterStateImplCopyWithImpl(_$UnitConverterStateImpl _value,
      $Res Function(_$UnitConverterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputValue = null,
    Object? fromUnit = null,
    Object? toUnit = null,
    Object? allResults = null,
  }) {
    return _then(_$UnitConverterStateImpl(
      inputValue: null == inputValue
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as double,
      fromUnit: null == fromUnit
          ? _value.fromUnit
          : fromUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      toUnit: null == toUnit
          ? _value.toUnit
          : toUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      allResults: null == allResults
          ? _value._allResults
          : allResults // ignore: cast_nullable_to_non_nullable
              as Map<AreaUnit, double>,
    ));
  }
}

/// @nodoc

class _$UnitConverterStateImpl implements _UnitConverterState {
  const _$UnitConverterStateImpl(
      {this.inputValue = 0.0,
      this.fromUnit = AreaUnit.squareFeet,
      this.toUnit = AreaUnit.katha,
      final Map<AreaUnit, double> allResults = const {}})
      : _allResults = allResults;

  @override
  @JsonKey()
  final double inputValue;
  @override
  @JsonKey()
  final AreaUnit fromUnit;
  @override
  @JsonKey()
  final AreaUnit toUnit;
  final Map<AreaUnit, double> _allResults;
  @override
  @JsonKey()
  Map<AreaUnit, double> get allResults {
    if (_allResults is EqualUnmodifiableMapView) return _allResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_allResults);
  }

  @override
  String toString() {
    return 'UnitConverterState(inputValue: $inputValue, fromUnit: $fromUnit, toUnit: $toUnit, allResults: $allResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitConverterStateImpl &&
            (identical(other.inputValue, inputValue) ||
                other.inputValue == inputValue) &&
            (identical(other.fromUnit, fromUnit) ||
                other.fromUnit == fromUnit) &&
            (identical(other.toUnit, toUnit) || other.toUnit == toUnit) &&
            const DeepCollectionEquality()
                .equals(other._allResults, _allResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inputValue, fromUnit, toUnit,
      const DeepCollectionEquality().hash(_allResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitConverterStateImplCopyWith<_$UnitConverterStateImpl> get copyWith =>
      __$$UnitConverterStateImplCopyWithImpl<_$UnitConverterStateImpl>(
          this, _$identity);
}

abstract class _UnitConverterState implements UnitConverterState {
  const factory _UnitConverterState(
      {final double inputValue,
      final AreaUnit fromUnit,
      final AreaUnit toUnit,
      final Map<AreaUnit, double> allResults}) = _$UnitConverterStateImpl;

  @override
  double get inputValue;
  @override
  AreaUnit get fromUnit;
  @override
  AreaUnit get toUnit;
  @override
  Map<AreaUnit, double> get allResults;
  @override
  @JsonKey(ignore: true)
  _$$UnitConverterStateImplCopyWith<_$UnitConverterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
