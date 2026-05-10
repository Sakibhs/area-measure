import 'package:area_and_plot/core/constants/app_constants.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:area_and_plot/features/history/presentation/providers/history_provider.dart';
import 'package:area_and_plot/features/map_calculator/domain/entities/map_area_point.dart';
import 'package:area_and_plot/features/map_calculator/presentation/providers/map_calculator_provider.dart';
import 'package:area_and_plot/features/map_calculator/presentation/providers/map_style_provider.dart';
import 'package:area_and_plot/features/map_calculator/presentation/widgets/map_style_button.dart';
import 'package:area_and_plot/features/map_calculator/presentation/widgets/saved_areas_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class MapViewWidget extends ConsumerStatefulWidget {
  const MapViewWidget({super.key});

  @override
  ConsumerState<MapViewWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends ConsumerState<MapViewWidget> {
  final _mapController = MapController();
  int? _draggingIndex;

  static const _hitRadius = 30.0;
  static const _midHitRadius = 22.0;
  static const _key = AppConstants.maptilerApiKey;

  String _tileUrl(MapStyle style) => style == MapStyle.street
      ? 'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=$_key'
      : 'https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=$_key';

  static List<LatLng> _midpoints(List<LatLng> latlngs) {
    if (latlngs.length < 3) return [];
    return List.generate(latlngs.length, (i) {
      final a = latlngs[i];
      final b = latlngs[(i + 1) % latlngs.length];
      return LatLng(
        (a.latitude + b.latitude) / 2,
        (a.longitude + b.longitude) / 2,
      );
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _onPointerDown(PointerDownEvent event, List<MapAreaPoint> points) {
    final camera = _mapController.camera;
    final latlngs = points.map((p) => LatLng(p.latitude, p.longitude)).toList();

    // Check main vertices first (larger hit area)
    for (int i = 0; i < latlngs.length; i++) {
      final screen = camera.latLngToScreenOffset(latlngs[i]);
      if ((screen - event.localPosition).distance < _hitRadius) {
        setState(() => _draggingIndex = i);
        return;
      }
    }

    // Check midpoints — touching one inserts a new vertex there and drags it
    final mids = _midpoints(latlngs);
    for (int i = 0; i < mids.length; i++) {
      final screen = camera.latLngToScreenOffset(mids[i]);
      if ((screen - event.localPosition).distance < _midHitRadius) {
        ref
            .read(mapCalculatorNotifierProvider.notifier)
            .insertPoint(
              i,
              MapAreaPoint(
                latitude: mids[i].latitude,
                longitude: mids[i].longitude,
              ),
            );
        setState(() => _draggingIndex = i + 1);
        return;
      }
    }
  }

  void _onPointerMove(LatLng latLng) {
    if (_draggingIndex == null) return;
    ref
        .read(mapCalculatorNotifierProvider.notifier)
        .movePoint(
          _draggingIndex!,
          MapAreaPoint(latitude: latLng.latitude, longitude: latLng.longitude),
        );
  }

  void _onPointerUp() {
    if (_draggingIndex != null) setState(() => _draggingIndex = null);
  }

  List<HistoryEntry> _savedMapEntries() {
    final async = ref.watch(historyNotifierProvider);
    return async.maybeWhen(
      data: (list) => list
          .where(
            (e) =>
                (e.type == HistoryType.mapCalculator ||
                        e.type == HistoryType.mapDistance) &&
                (e.mapPoints?.length ?? 0) >= 4,
          )
          .toList(),
      orElse: () => const <HistoryEntry>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mapCalculatorNotifierProvider);
    final notifier = ref.read(mapCalculatorNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final mapStyle =
        ref.watch(mapStyleNotifierProvider).valueOrNull ?? MapStyle.satellite;
    final points = state.points;
    final latlngs = points.map((p) => LatLng(p.latitude, p.longitude)).toList();
    final mids = _midpoints(latlngs);

    final allSavedEntries = _savedMapEntries();
    final showSaved = state.showSavedAreas && points.isEmpty;
    final savedEntries = showSaved ? allSavedEntries : const <HistoryEntry>[];
    final hasSavedAvailable = allSavedEntries.isNotEmpty;

    final isDistanceMode = state.mode == MeasureMode.distance;

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
                      longitude: point.longitude,
                    ),
                  ),
            onPointerDown: (event, _) => _onPointerDown(event, points),
            onPointerMove: (_, latLng) => _onPointerMove(latLng),
            onPointerUp: (_, __) => _onPointerUp(),
            onPointerCancel: (_, __) => _onPointerUp(),
          ),
          children: [
            TileLayer(
              urlTemplate: _tileUrl(mapStyle),
              maxZoom: 22,
              maxNativeZoom: 22,
              userAgentPackageName: 'net.appcolors.area_and_plot',
            ),
            ...SavedAreasOverlay.buildLayers(savedEntries),
            if (!isDistanceMode && latlngs.length >= 3)
              PolygonLayer(
                polygons: [
                  Polygon(
                    points: latlngs,
                    color: Colors.amber.withAlpha(70),
                    borderColor: Colors.deepPurple.shade900,
                    borderStrokeWidth: 2.5,
                  ),
                ],
              )
            else if (isDistanceMode && latlngs.length >= 2)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: latlngs,
                    color: Colors.deepPurple.shade900,
                    strokeWidth: 3.0,
                  ),
                ],
              )
            else if (!isDistanceMode && latlngs.length == 2)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: latlngs,
                    color: colorScheme.primary,
                    strokeWidth: 2.5,
                  ),
                ],
              ),
            // Midpoint markers (smaller circles on each edge) — only for area polygon
            if (!isDistanceMode && mids.isNotEmpty)
              MarkerLayer(
                markers: List.generate(mids.length, (i) {
                  return Marker(
                    point: mids[i],
                    width: 12,
                    height: 12,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withAlpha(160),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                    ),
                  );
                }),
              ),
            // Main vertex markers
            MarkerLayer(
              markers: List.generate(latlngs.length, (i) {
                final isDragging = _draggingIndex == i;
                return Marker(
                  point: latlngs[i],
                  width: isDragging ? 22 : 18,
                  height: isDragging ? 22 : 18,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: isDragging ? 0 : 120),
                    decoration: BoxDecoration(
                      color: isDragging
                          ? colorScheme.secondary
                          : colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color:
                              (isDragging
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
          top: 56,
          right: 12,
          child: Column(
            children: [
              MapStyleButton(
                current: mapStyle,
                onSelected: (style) =>
                    ref.read(mapStyleNotifierProvider.notifier).setStyle(style),
              ),
              if (hasSavedAvailable) ...[
                const SizedBox(height: 8),
                _SavedAreasToggleButton(
                  showing: state.showSavedAreas,
                  onTap: notifier.toggleSavedAreas,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SavedAreasToggleButton extends StatelessWidget {
  const _SavedAreasToggleButton({required this.showing, required this.onTap});

  final bool showing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Icon(
          showing ? Icons.layers : Icons.layers_clear,
          size: 20,
          color: showing ? Colors.teal.shade700 : Colors.black54,
        ),
      ),
    );
  }
}
