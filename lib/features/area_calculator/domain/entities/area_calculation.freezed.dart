// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_calculation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AreaCalculation {
  String get id => throw _privateConstructorUsedError;
  AreaShape get shape => throw _privateConstructorUsedError;
  List<double> get dimensions => throw _privateConstructorUsedError;
  double get areaInSqFt => throw _privateConstructorUsedError;
  AreaUnit get displayUnit => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AreaCalculationCopyWith<AreaCalculation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaCalculationCopyWith<$Res> {
  factory $AreaCalculationCopyWith(
          AreaCalculation value, $Res Function(AreaCalculation) then) =
      _$AreaCalculationCopyWithImpl<$Res, AreaCalculation>;
  @useResult
  $Res call(
      {String id,
      AreaShape shape,
      List<double> dimensions,
      double areaInSqFt,
      AreaUnit displayUnit,
      DateTime createdAt,
      bool isFavorite,
      String? label});
}

/// @nodoc
class _$AreaCalculationCopyWithImpl<$Res, $Val extends AreaCalculation>
    implements $AreaCalculationCopyWith<$Res> {
  _$AreaCalculationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shape = null,
    Object? dimensions = null,
    Object? areaInSqFt = null,
    Object? displayUnit = null,
    Object? createdAt = null,
    Object? isFavorite = null,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as AreaShape,
      dimensions: null == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      areaInSqFt: null == areaInSqFt
          ? _value.areaInSqFt
          : areaInSqFt // ignore: cast_nullable_to_non_nullable
              as double,
      displayUnit: null == displayUnit
          ? _value.displayUnit
          : displayUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AreaCalculationImplCopyWith<$Res>
    implements $AreaCalculationCopyWith<$Res> {
  factory _$$AreaCalculationImplCopyWith(_$AreaCalculationImpl value,
          $Res Function(_$AreaCalculationImpl) then) =
      __$$AreaCalculationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      AreaShape shape,
      List<double> dimensions,
      double areaInSqFt,
      AreaUnit displayUnit,
      DateTime createdAt,
      bool isFavorite,
      String? label});
}

/// @nodoc
class __$$AreaCalculationImplCopyWithImpl<$Res>
    extends _$AreaCalculationCopyWithImpl<$Res, _$AreaCalculationImpl>
    implements _$$AreaCalculationImplCopyWith<$Res> {
  __$$AreaCalculationImplCopyWithImpl(
      _$AreaCalculationImpl _value, $Res Function(_$AreaCalculationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shape = null,
    Object? dimensions = null,
    Object? areaInSqFt = null,
    Object? displayUnit = null,
    Object? createdAt = null,
    Object? isFavorite = null,
    Object? label = freezed,
  }) {
    return _then(_$AreaCalculationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as AreaShape,
      dimensions: null == dimensions
          ? _value._dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      areaInSqFt: null == areaInSqFt
          ? _value.areaInSqFt
          : areaInSqFt // ignore: cast_nullable_to_non_nullable
              as double,
      displayUnit: null == displayUnit
          ? _value.displayUnit
          : displayUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AreaCalculationImpl implements _AreaCalculation {
  const _$AreaCalculationImpl(
      {required this.id,
      required this.shape,
      required final List<double> dimensions,
      required this.areaInSqFt,
      required this.displayUnit,
      required this.createdAt,
      this.isFavorite = false,
      this.label})
      : _dimensions = dimensions;

  @override
  final String id;
  @override
  final AreaShape shape;
  final List<double> _dimensions;
  @override
  List<double> get dimensions {
    if (_dimensions is EqualUnmodifiableListView) return _dimensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dimensions);
  }

  @override
  final double areaInSqFt;
  @override
  final AreaUnit displayUnit;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  final String? label;

  @override
  String toString() {
    return 'AreaCalculation(id: $id, shape: $shape, dimensions: $dimensions, areaInSqFt: $areaInSqFt, displayUnit: $displayUnit, createdAt: $createdAt, isFavorite: $isFavorite, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaCalculationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shape, shape) || other.shape == shape) &&
            const DeepCollectionEquality()
                .equals(other._dimensions, _dimensions) &&
            (identical(other.areaInSqFt, areaInSqFt) ||
                other.areaInSqFt == areaInSqFt) &&
            (identical(other.displayUnit, displayUnit) ||
                other.displayUnit == displayUnit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      shape,
      const DeepCollectionEquality().hash(_dimensions),
      areaInSqFt,
      displayUnit,
      createdAt,
      isFavorite,
      label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaCalculationImplCopyWith<_$AreaCalculationImpl> get copyWith =>
      __$$AreaCalculationImplCopyWithImpl<_$AreaCalculationImpl>(
          this, _$identity);
}

abstract class _AreaCalculation implements AreaCalculation {
  const factory _AreaCalculation(
      {required final String id,
      required final AreaShape shape,
      required final List<double> dimensions,
      required final double areaInSqFt,
      required final AreaUnit displayUnit,
      required final DateTime createdAt,
      final bool isFavorite,
      final String? label}) = _$AreaCalculationImpl;

  @override
  String get id;
  @override
  AreaShape get shape;
  @override
  List<double> get dimensions;
  @override
  double get areaInSqFt;
  @override
  AreaUnit get displayUnit;
  @override
  DateTime get createdAt;
  @override
  bool get isFavorite;
  @override
  String? get label;
  @override
  @JsonKey(ignore: true)
  _$$AreaCalculationImplCopyWith<_$AreaCalculationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
