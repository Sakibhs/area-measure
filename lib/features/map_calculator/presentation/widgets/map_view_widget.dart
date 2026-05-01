import 'package:area_and_plot/core/constants/app_constants.dart';
import 'package:area_and_plot/features/map_calculator/domain/entities/map_area_point.dart';
import 'package:area_and_plot/features/map_calculator/presentation/providers/map_calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

enum _MapStyle { street, satellite }

class MapViewWidget extends ConsumerStatefulWidget {
  const MapViewWidget({super.key});

  @override
  ConsumerState<MapViewWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends ConsumerState<MapViewWidget> {
  final _mapController = MapController();
  int? _draggingIndex;
  _MapStyle _mapStyle = _MapStyle.street;

  static const _hitRadius = 30.0;
  static const _key = AppConstants.maptilerApiKey;

  String get _tileUrl => _mapStyle == _MapStyle.street
      ? 'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=$_key'
      : 'https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=$_key';

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _onPointerDown(PointerDownEvent event, List<MapAreaPoint> points) {
    final camera = _mapController.camera;
    for (int i = 0; i < points.length; i++) {
      final screen = camera.latLngToScreenOffset(
        LatLng(points[i].latitude, points[i].longitude),
      );
      if ((screen - event.localPosition).distance < _hitRadius) {
        setState(() => _draggingIndex = i);
        return;
      }
    }
  }

  void _onPointerMove(LatLng latLng) {
    final idx = _draggingIndex;
    if (idx == null) return;
    ref.read(mapCalculatorNotifierProvider.notifier).movePoint(
          idx,
          MapAreaPoint(latitude: latLng.latitude, longitude: latLng.longitude),
        );
  }

  void _onPointerUp() {
    if (_draggingIndex != null) setState(() => _draggingIndex = null);
  }

  void _toggleMapStyle() {
    setState(() {
      _mapStyle = _mapStyle == _MapStyle.street
          ? _MapStyle.satellite
          : _MapStyle.street;
    });
  }

  @override
  Widget build(BuildContext context) {
    final points = ref.watch(mapCalculatorNotifierProvider).points;
    final notifier = ref.read(mapCalculatorNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final latlngs = points.map((p) => LatLng(p.latitude, p.longitude)).toList();
    final isSatellite = _mapStyle == _MapStyle.satellite;

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: const LatLng(
              AppConstants.defaultMapLatitude,
              AppConstants.defaultMapLongitude,
            ),
            initialZoom: AppConstants.defaultMapZoom,
            maxZoom: 22,
            interactionOptions: InteractionOptions(
              flags: _draggingIndex != null
                  ? InteractiveFlag.none
                  : InteractiveFlag.all,
            ),
            onTap: _draggingIndex != null
                ? null
                : (_, point) => notifier.addPoint(
                      MapAreaPoint(
                          latitude: point.latitude,
                          longitude: point.longitude),
                    ),
            onPointerDown: (event, _) => _onPointerDown(event, points),
            onPointerMove: (_, latLng) => _onPointerMove(latLng),
            onPointerUp: (_, __) => _onPointerUp(),
            onPointerCancel: (_, __) => _onPointerUp(),
          ),
          children: [
            TileLayer(
              urlTemplate: _tileUrl,
              maxZoom: 22,
              maxNativeZoom: 22,
              userAgentPackageName: 'net.appcolors.area_and_plot',
            ),
            if (latlngs.length >= 3)
              PolygonLayer(
                polygons: [
                  Polygon(
                    points: latlngs,
                    color: colorScheme.primary.withAlpha(40),
                    borderColor: colorScheme.primary,
                    borderStrokeWidth: 2.5,
                  ),
                ],
              )
            else if (latlngs.length == 2)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: latlngs,
                    color: colorScheme.primary,
                    strokeWidth: 2.5,
                  ),
                ],
              ),
            MarkerLayer(
              markers: List.generate(latlngs.length, (i) {
                final isDragging = _draggingIndex == i;
                return Marker(
                  point: latlngs[i],
                  width: isDragging ? 38 : 28,
                  height: isDragging ? 38 : 28,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    decoration: BoxDecoration(
                      color: isDragging
                          ? colorScheme.secondary
                          : colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: (isDragging
                                  ? colorScheme.secondary
                                  : colorScheme.primary)
                              .withAlpha(isDragging ? 130 : 80),
                          blurRadius: isDragging ? 12 : 5,
                          spreadRadius: isDragging ? 3 : 1,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: _toggleMapStyle,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 6),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isSatellite ? Icons.map_outlined : Icons.satellite_alt,
                    size: 16,
                    color: Colors.black87,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    isSatellite ? 'Street' : 'Satellite',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
