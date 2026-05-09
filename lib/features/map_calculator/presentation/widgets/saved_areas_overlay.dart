import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SavedAreasOverlay {
  const SavedAreasOverlay._();

  static List<Widget> buildLayers(List<HistoryEntry> entries) {
    if (entries.isEmpty) return const [];
    final polygons = <Polygon>[];
    final decoded = <_DecodedEntry>[];
    for (final entry in entries) {
      final pts = _decode(entry.mapPoints);
      if (pts.length < 3) continue;
      decoded.add(_DecodedEntry(entry, pts));
      polygons.add(
        Polygon(
          points: pts,
          color: Colors.teal.withAlpha(45),
          borderColor: Colors.teal.shade700,
          borderStrokeWidth: 1.5,
        ),
      );
    }
    if (polygons.isEmpty) return const [];
    return [
      PolygonLayer(polygons: polygons),
      _SavedAreaLabelsLayer(items: decoded),
    ];
  }

  static List<LatLng> _decode(List<double>? flat) {
    if (flat == null || flat.length < 6) return const [];
    final out = <LatLng>[];
    for (int i = 0; i + 1 < flat.length; i += 2) {
      out.add(LatLng(flat[i], flat[i + 1]));
    }
    return out;
  }
}

class _DecodedEntry {
  const _DecodedEntry(this.entry, this.points);
  final HistoryEntry entry;
  final List<LatLng> points;
}

class _SavedAreaLabelsLayer extends StatelessWidget {
  const _SavedAreaLabelsLayer({required this.items});

  final List<_DecodedEntry> items;

  static const _minWidthPx = 80.0;
  static const _minHeightPx = 28.0;

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);
    final markers = <Marker>[];
    for (final item in items) {
      final label = item.entry.label;
      if (label == null || label.trim().isEmpty) continue;

      double minX = double.infinity, minY = double.infinity;
      double maxX = -double.infinity, maxY = -double.infinity;
      double sumLat = 0, sumLng = 0;
      for (final p in item.points) {
        final s = camera.latLngToScreenOffset(p);
        if (s.dx < minX) minX = s.dx;
        if (s.dy < minY) minY = s.dy;
        if (s.dx > maxX) maxX = s.dx;
        if (s.dy > maxY) maxY = s.dy;
        sumLat += p.latitude;
        sumLng += p.longitude;
      }
      final w = maxX - minX;
      final h = maxY - minY;
      if (w < _minWidthPx || h < _minHeightPx) continue;

      markers.add(
        Marker(
          point: LatLng(sumLat / item.points.length, sumLng / item.points.length),
          width: w.clamp(60.0, 240.0).toDouble(),
          height: 24,
          alignment: Alignment.center,
          child: Center(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 3, offset: Offset(0, 1)),
                  Shadow(color: Colors.black, blurRadius: 2),
                ],
              ),
            ),
          ),
        ),
      );
    }
    if (markers.isEmpty) return const SizedBox.shrink();
    return MarkerLayer(markers: markers);
  }
}
