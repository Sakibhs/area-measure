import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_camera.freezed.dart';

@freezed
class MapCameraState with _$MapCameraState {
  const factory MapCameraState({
    required double latitude,
    required double longitude,
    required double zoom,
  }) = _MapCameraState;
}
