import 'dart:async';

import 'package:area_and_plot/features/map_calculator/domain/entities/map_camera.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'map_camera_provider.g.dart';

const _latKey = 'map_camera_lat';
const _lonKey = 'map_camera_lon';
const _zoomKey = 'map_camera_zoom';

@Riverpod(keepAlive: true)
class MapCameraNotifier extends _$MapCameraNotifier {
  SharedPreferences? _prefs;
  Timer? _saveDebounce;

  @override
  Future<MapCameraState?> build() async {
    ref.onDispose(() {
      _saveDebounce?.cancel();
    });
    try {
      _prefs = await SharedPreferences.getInstance();
      final lat = _prefs!.getDouble(_latKey);
      final lon = _prefs!.getDouble(_lonKey);
      final zoom = _prefs!.getDouble(_zoomKey);
      if (lat != null && lon != null && zoom != null) {
        return MapCameraState(latitude: lat, longitude: lon, zoom: zoom);
      }
      return null;
    } catch (e, st) {
      debugPrint('MapCameraNotifier load error: $e\n$st');
      return null;
    }
  }

  void save(LatLng center, double zoom) {
    final next = MapCameraState(
      latitude: center.latitude,
      longitude: center.longitude,
      zoom: zoom,
    );
    state = AsyncData(next);

    _saveDebounce?.cancel();
    _saveDebounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        _prefs ??= await SharedPreferences.getInstance();
        await _prefs!.setDouble(_latKey, next.latitude);
        await _prefs!.setDouble(_lonKey, next.longitude);
        await _prefs!.setDouble(_zoomKey, next.zoom);
      } catch (e, st) {
        debugPrint('MapCameraNotifier save error: $e\n$st');
      }
    });
  }
}
