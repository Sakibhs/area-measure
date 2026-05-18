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
      if (_isValidCamera(lat, lon, zoom)) {
        return MapCameraState(latitude: lat!, longitude: lon!, zoom: zoom!);
      }
      // Drop any corrupt/legacy values so we don't keep loading them.
      await _clear();
      return null;
    } catch (e, st) {
      debugPrint('MapCameraNotifier load error: $e\n$st');
      return null;
    }
  }

  void save(LatLng center, double zoom) {
    if (!_isValidCamera(center.latitude, center.longitude, zoom)) {
      debugPrint(
        'MapCameraNotifier ignored non-finite save: '
        '$center zoom=$zoom',
      );
      return;
    }
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

  Future<void> _clear() async {
    try {
      _prefs ??= await SharedPreferences.getInstance();
      await _prefs!.remove(_latKey);
      await _prefs!.remove(_lonKey);
      await _prefs!.remove(_zoomKey);
    } catch (e, st) {
      debugPrint('MapCameraNotifier clear error: $e\n$st');
    }
  }

  static bool _isValidCamera(double? lat, double? lon, double? zoom) {
    if (lat == null || lon == null || zoom == null) return false;
    if (!lat.isFinite || !lon.isFinite || !zoom.isFinite) return false;
    if (lat < -90 || lat > 90) return false;
    if (lon < -180 || lon > 180) return false;
    return true;
  }
}
