import 'dart:math' as math;

import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SavedAreasOverlay {
  const SavedAreasOverlay._();

  static const _distance = Distance();

  static List<Widget> buildLayers(List<HistoryEntry> entries) {
    if (entries.isEmpty) return const [];
    final polygons = <Polygon>[];
    final polylines = <Polyline>[];
    final decoded = <_DecodedEntry>[];

    for (final entry in entries) {
      final pts = _decode(entry.mapPoints);
      final isDistance = entry.type == HistoryType.mapDistance;
      final minPts = isDistance ? 2 : 3;
      if (pts.length < minPts) continue;
      decoded.add(_DecodedEntry(entry, pts, isDistance));
      if (isDistance) {
        polylines.add(
          Polyline(
            points: pts,
            color: Colors.deepOrange.shade700,
            strokeWidth: 2.5,
          ),
        );
      } else {
        polygons.add(
          Polygon(
            points: pts,
            color: Colors.teal.withAlpha(45),
            borderColor: Colors.teal.shade700,
            borderStrokeWidth: 1.5,
          ),
        );
      }
    }
    if (polygons.isEmpty && polylines.isEmpty) return const [];

    return [
      if (polygons.isNotEmpty) PolygonLayer(polygons: polygons),
      if (polylines.isNotEmpty) PolylineLayer(polylines: polylines),
      _SavedLabelsLayer(items: decoded),
    ];
  }

  static List<LatLng> _decode(List<double>? flat) {
    if (flat == null || flat.length < 4) return const [];
    final out = <LatLng>[];
    for (int i = 0; i + 1 < flat.length; i += 2) {
      final lat = flat[i];
      final lon = flat[i + 1];
      if (!lat.isFinite || !lon.isFinite) return const [];
      if (lat < -90 || lat > 90 || lon < -180 || lon > 180) return const [];
      out.add(LatLng(lat, lon));
    }
    return out;
  }

  static double segmentMeters(LatLng a, LatLng b) =>
      _distance.as(LengthUnit.Meter, a, b);
}

class _DecodedEntry {
  const _DecodedEntry(this.entry, this.points, this.isDistance);
  final HistoryEntry entry;
  final List<LatLng> points;
  final bool isDistance;
}

class _SavedLabelsLayer extends StatelessWidget {
  const _SavedLabelsLayer({required this.items});

  final List<_DecodedEntry> items;

  static const _minPolyWidthPx = 80.0;
  static const _minPolyHeightPx = 28.0;
  static const _minSegmentPx = 60.0;

  String _formatMeters(double m) {
    if (m >= 1000) return '${(m / 1000).toStringAsFixed(2)} km';
    if (m >= 100) return '${m.toStringAsFixed(0)} m';
    return '${m.toStringAsFixed(1)} m';
  }

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);
    final markers = <Marker>[];

    for (final item in items) {
      final pts = item.points;
      final screenPts = pts.map(camera.latLngToScreenOffset).toList();

      // Plot name label at centroid (only for polygons that are large enough on screen)
      if (!item.isDistance) {
        final label = item.entry.label;
        if (label != null && label.trim().isNotEmpty) {
          double minX = double.infinity, minY = double.infinity;
          double maxX = -double.infinity, maxY = -double.infinity;
          double sumLat = 0, sumLng = 0;
          for (int i = 0; i < pts.length; i++) {
            final s = screenPts[i];
            if (s.dx < minX) minX = s.dx;
            if (s.dy < minY) minY = s.dy;
            if (s.dx > maxX) maxX = s.dx;
            if (s.dy > maxY) maxY = s.dy;
            sumLat += pts[i].latitude;
            sumLng += pts[i].longitude;
          }
          final w = maxX - minX;
          final h = maxY - minY;
          if (w >= _minPolyWidthPx && h >= _minPolyHeightPx) {
            markers.add(
              Marker(
                point: LatLng(sumLat / pts.length, sumLng / pts.length),
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
        }
      }

      // Side length labels (parallel to each edge, in meters)
      final segCount = item.isDistance ? pts.length - 1 : pts.length;
      for (int i = 0; i < segCount; i++) {
        final a = pts[i];
        final b = pts[(i + 1) % pts.length];
        final sa = screenPts[i];
        final sb = screenPts[(i + 1) % pts.length];
        final dx = sb.dx - sa.dx;
        final dy = sb.dy - sa.dy;
        final segPx = math.sqrt(dx * dx + dy * dy);
        if (segPx < _minSegmentPx) continue;

        final meters = SavedAreasOverlay.segmentMeters(a, b);
        final text = _formatMeters(meters);

        // Angle of the edge in screen coords; flip if it would be upside-down.
        double angle = math.atan2(dy, dx);
        if (angle > math.pi / 2) angle -= math.pi;
        if (angle < -math.pi / 2) angle += math.pi;

        final mid = LatLng(
          (a.latitude + b.latitude) / 2,
          (a.longitude + b.longitude) / 2,
        );

        final markerW = segPx.clamp(60.0, 240.0).toDouble();

        markers.add(
          Marker(
            point: mid,
            width: markerW,
            height: 22,
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: angle,
              child: Center(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: item.isDistance
                        ? Colors.deepOrange.shade100
                        : Colors.tealAccent.shade100,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    shadows: const [
                      Shadow(color: Colors.black, blurRadius: 3, offset: Offset(0, 1)),
                      Shadow(color: Colors.black, blurRadius: 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    if (markers.isEmpty) return const SizedBox.shrink();
    return MarkerLayer(markers: markers);
  }
}
