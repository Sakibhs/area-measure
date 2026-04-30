import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_area_point.freezed.dart';

@freezed
class MapAreaPoint with _$MapAreaPoint {
  const factory MapAreaPoint({
    required double latitude,
    required double longitude,
  }) = _MapAreaPoint;
}
