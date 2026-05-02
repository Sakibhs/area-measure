import 'dart:math';

import 'package:area_and_plot/core/constants/app_constants.dart';
import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/area_converter.dart';
import 'package:area_and_plot/core/utils/number_formatter.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:area_and_plot/features/history/presentation/providers/history_provider.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart' hide Path;

class HistoryDetailScreen extends ConsumerWidget {
  const HistoryDetailScreen({super.key, required this.entry});

  final HistoryEntry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final live = ref
            .watch(historyNotifierProvider)
            .valueOrNull
            ?.firstWhere((e) => e.id == entry.id, orElse: () => entry) ??
        entry;

    final l = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final isMap = live.type == HistoryType.mapCalculator;
    final color = isMap ? cs.tertiary : cs.primary;
    final allValues = AreaConverter.convertToAll(live.areaInSqFt);
    final title = live.label ??
        (isMap
            ? l.mapCalculator
            : live.shape?.label(l.localeName) ?? l.areaCalculator);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(
              live.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: live.isFavorite ? Colors.red : null,
            ),
            onPressed: () => ref
                .read(historyNotifierProvider.notifier)
                .toggleFavorite(live.id, isFavorite: !live.isFavorite),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            color: cs.error,
            onPressed: () => _confirmDelete(context, ref, l),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 220,
            child: isMap
                ? _MapHeader(live: live, cs: cs)
                : Container(
                    color: color.withAlpha(15),
                    child: CustomPaint(painter: _ShapePainter(live, color)),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionLabel(l.allAreaValues),
                const SizedBox(height: 8),
                Card(
                  child: Column(
                    children: AreaUnit.values.map((unit) {
                      final val = allValues[unit] ?? 0.0;
                      final isPrimary = unit == live.displayUnit;
                      return ListTile(
                        dense: true,
                        title: Text(
                          unit.label(l.localeName),
                          style: isPrimary
                              ? TextStyle(
                                  fontWeight: FontWeight.bold, color: color)
                              : null,
                        ),
                        trailing: Text(
                          NumberFormatter.format(val),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: isPrimary
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isPrimary ? color : null,
                              ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                if (!isMap && live.dimensions != null) ...[
                  _SectionLabel(l.dimensions),
                  const SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: _buildDimensionTiles(live, l),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isMap && live.mapPointCount != null) ...[
                  _SectionLabel(l.details),
                  const SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      dense: true,
                      title: Text(l.vertices),
                      trailing: Text(
                        '${live.mapPointCount}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                _SectionLabel(l.dateCreated),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    dense: true,
                    leading: Icon(Icons.calendar_today_outlined,
                        size: 18, color: cs.onSurfaceVariant),
                    title: Text(DateFormat('dd MMM yyyy, hh:mm a')
                        .format(live.createdAt)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDimensionTiles(HistoryEntry e, AppLocalizations l) {
    final dims = e.dimensions!;
    switch (e.shape) {
      case AreaShape.rectangle:
        return [
          _dimTile(l.width, dims[0]),
          const Divider(height: 1),
          _dimTile(l.length, dims[1]),
        ];
      case AreaShape.triangle:
        return [
          _dimTile(l.base, dims[0]),
          const Divider(height: 1),
          _dimTile(l.height, dims[1]),
        ];
      case AreaShape.polygon:
        return [
          ListTile(
            dense: true,
            title: Text(l.vertices),
            trailing: Text('${dims.length ~/ 2}'),
          ),
        ];
      default:
        return [];
    }
  }

  Widget _dimTile(String label, double value) => ListTile(
        dense: true,
        title: Text(label),
        trailing: Text('${NumberFormatter.format(value)} ft'),
      );

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, AppLocalizations l) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.deleteConfirmTitle),
        content: Text(l.deleteConfirmMessage),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l.delete)),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      await ref.read(historyNotifierProvider.notifier).delete(entry.id);
      if (context.mounted) Navigator.pop(context);
    }
  }
}

class _MapHeader extends StatelessWidget {
  const _MapHeader({required this.live, required this.cs});

  final HistoryEntry live;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    final raw = live.mapPoints;
    final latlngs = <LatLng>[];
    if (raw != null) {
      for (int i = 0; i + 1 < raw.length; i += 2) {
        latlngs.add(LatLng(raw[i], raw[i + 1]));
      }
    }

    const key = AppConstants.maptilerApiKey;

    final cameraFit = latlngs.length >= 2
        ? CameraFit.coordinates(
            coordinates: latlngs,
            padding: const EdgeInsets.all(40),
          )
        : CameraFit.bounds(
            bounds: LatLngBounds(
              const LatLng(AppConstants.defaultMapLatitude - 0.01,
                  AppConstants.defaultMapLongitude - 0.01),
              const LatLng(AppConstants.defaultMapLatitude + 0.01,
                  AppConstants.defaultMapLongitude + 0.01),
            ),
          );

    return FlutterMap(
      options: MapOptions(
        initialCameraFit: cameraFit,
        interactionOptions:
            const InteractionOptions(flags: InteractiveFlag.none),
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=$key',
          maxZoom: 22,
          userAgentPackageName: 'net.appcolors.area_and_plot',
        ),
        if (latlngs.length >= 3)
          PolygonLayer(
            polygons: [
              Polygon(
                points: latlngs,
                color: cs.primary.withAlpha(60),
                borderColor: cs.primary,
                borderStrokeWidth: 2.5,
              ),
            ],
          ),
        if (latlngs.isNotEmpty)
          MarkerLayer(
            markers: latlngs
                .map((p) => Marker(
                      point: p,
                      width: 10,
                      height: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: cs.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                      ),
                    ))
                .toList(),
          ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);
  final String label;

  @override
  Widget build(BuildContext context) => Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      );
}

class _ShapePainter extends CustomPainter {
  const _ShapePainter(this.entry, this.color);
  final HistoryEntry entry;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()
      ..color = color.withAlpha(50)
      ..style = PaintingStyle.fill;
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeJoin = StrokeJoin.round;
    final path = _buildPath(size);
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
  }

  Path _buildPath(Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.shortestSide * 0.35;

    switch (entry.shape) {
      case AreaShape.rectangle:
        final dims = entry.dimensions;
        var ratio = 1.5;
        if (dims != null && dims.length >= 2 && dims[0] > 0 && dims[1] > 0) {
          ratio = (dims[0] / dims[1]).clamp(0.4, 2.5);
        }
        final rw = ratio >= 1 ? r : r * ratio;
        final rh = ratio >= 1 ? r / ratio : r;
        return Path()
          ..addRect(Rect.fromCenter(
              center: Offset(cx, cy), width: rw * 2.4, height: rh * 2.4));

      case AreaShape.triangle:
        return Path()
          ..moveTo(cx, cy - r)
          ..lineTo(cx + r, cy + r * 0.75)
          ..lineTo(cx - r, cy + r * 0.75)
          ..close();

      case AreaShape.polygon:
        final dims = entry.dimensions;
        if (dims != null && dims.length >= 6) {
          return _polygonFromCoords(dims, size);
        }
        return _regularPolygon(cx, cy, r, 5);

      default:
        return _regularPolygon(cx, cy, r, 4);
    }
  }

  Path _polygonFromCoords(List<double> dims, Size size) {
    final xs = <double>[], ys = <double>[];
    for (int i = 0; i + 1 < dims.length; i += 2) {
      xs.add(dims[i]);
      ys.add(dims[i + 1]);
    }
    final minX = xs.reduce(min), maxX = xs.reduce(max);
    final minY = ys.reduce(min), maxY = ys.reduce(max);
    final rangeX = maxX - minX, rangeY = maxY - minY;
    final range = max(rangeX, rangeY);
    if (range == 0) return Path();

    final scale = size.shortestSide * 0.7 / range;
    final cx = size.width / 2, cy = size.height / 2;
    final offX = cx - (minX + maxX) / 2 * scale;
    final offY = cy - (minY + maxY) / 2 * scale;

    final path = Path();
    for (int i = 0; i < xs.length; i++) {
      final x = xs[i] * scale + offX;
      final y = ys[i] * scale + offY;
      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }
    return path..close();
  }

  Path _regularPolygon(double cx, double cy, double r, int sides) {
    final path = Path();
    for (int i = 0; i < sides; i++) {
      final a = (2 * pi * i / sides) - pi / 2;
      i == 0
          ? path.moveTo(cx + r * cos(a), cy + r * sin(a))
          : path.lineTo(cx + r * cos(a), cy + r * sin(a));
    }
    return path..close();
  }

  @override
  bool shouldRepaint(_ShapePainter old) =>
      old.entry != entry || old.color != color;
}
