import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

enum LocationErrorKind { serviceDisabled, permissionDenied, failed }

class LocationResult {
  const LocationResult._({this.position, this.error});

  const LocationResult.success(LatLng position)
    : this._(position: position, error: null);

  const LocationResult.failure(LocationErrorKind error)
    : this._(position: null, error: error);

  final LatLng? position;
  final LocationErrorKind? error;

  bool get isSuccess => position != null;
}

class LocationService {
  const LocationService();

  Future<LocationResult> getCurrentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return const LocationResult.failure(LocationErrorKind.serviceDisabled);
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return const LocationResult.failure(LocationErrorKind.permissionDenied);
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      return LocationResult.success(
        LatLng(position.latitude, position.longitude),
      );
    } catch (e, st) {
      debugPrint('LocationService error: $e\n$st');
      return const LocationResult.failure(LocationErrorKind.failed);
    }
  }
}
