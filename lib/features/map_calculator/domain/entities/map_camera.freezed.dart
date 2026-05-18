// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_camera.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapCameraState {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get zoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapCameraStateCopyWith<MapCameraState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapCameraStateCopyWith<$Res> {
  factory $MapCameraStateCopyWith(
          MapCameraState value, $Res Function(MapCameraState) then) =
      _$MapCameraStateCopyWithImpl<$Res, MapCameraState>;
  @useResult
  $Res call({double latitude, double longitude, double zoom});
}

/// @nodoc
class _$MapCameraStateCopyWithImpl<$Res, $Val extends MapCameraState>
    implements $MapCameraStateCopyWith<$Res> {
  _$MapCameraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? zoom = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      zoom: null == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapCameraStateImplCopyWith<$Res>
    implements $MapCameraStateCopyWith<$Res> {
  factory _$$MapCameraStateImplCopyWith(_$MapCameraStateImpl value,
          $Res Function(_$MapCameraStateImpl) then) =
      __$$MapCameraStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, double zoom});
}

/// @nodoc
class __$$MapCameraStateImplCopyWithImpl<$Res>
    extends _$MapCameraStateCopyWithImpl<$Res, _$MapCameraStateImpl>
    implements _$$MapCameraStateImplCopyWith<$Res> {
  __$$MapCameraStateImplCopyWithImpl(
      _$MapCameraStateImpl _value, $Res Function(_$MapCameraStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? zoom = null,
  }) {
    return _then(_$MapCameraStateImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      zoom: null == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MapCameraStateImpl implements _MapCameraState {
  const _$MapCameraStateImpl(
      {required this.latitude, required this.longitude, required this.zoom});

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double zoom;

  @override
  String toString() {
    return 'MapCameraState(latitude: $latitude, longitude: $longitude, zoom: $zoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapCameraStateImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.zoom, zoom) || other.zoom == zoom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, zoom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapCameraStateImplCopyWith<_$MapCameraStateImpl> get copyWith =>
      __$$MapCameraStateImplCopyWithImpl<_$MapCameraStateImpl>(
          this, _$identity);
}

abstract class _MapCameraState implements MapCameraState {
  const factory _MapCameraState(
      {required final double latitude,
      required final double longitude,
      required final double zoom}) = _$MapCameraStateImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get zoom;
  @override
  @JsonKey(ignore: true)
  _$$MapCameraStateImplCopyWith<_$MapCameraStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
