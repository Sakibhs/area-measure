import 'package:area_and_plot/core/constants/app_constants.dart';
import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/number_formatter.dart';
import 'package:area_and_plot/features/map_calculator/domain/entities/map_area_point.dart';
import 'package:area_and_plot/features/map_calculator/presentation/providers/map_calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapCalculatorScreen extends ConsumerStatefulWidget {
  const MapCalculatorScreen({super.key});

  @override
  ConsumerState<MapCalculatorScreen> createState() =>
      _MapCalculatorScreenState();
}

class _MapCalculatorScreenState extends ConsumerState<MapCalculatorScreen> {
  PointAnnotationManager? _annotationManager;
  PolylineAnnotationManager? _polylineManager;

  @override
  void initState() {
    super.initState();
    MapboxOptions.setAccessToken(AppConstants.mapboxAccessToken);
  }

  Future<void> _onMapCreated(MapboxMap map) async {
    _annotationManager =
        await map.annotations.createPointAnnotationManager();
    _polylineManager =
        await map.annotations.createPolylineAnnotationManager();
  }

  Future<void> _onMapTap(MapContentGestureContext ctx) async {
    final coord = ctx.point.coordinates;
    final point = MapAreaPoint(
      latitude: coord.lat.toDouble(),
      longitude: coord.lng.toDouble(),
    );
    ref.read(mapCalculatorNotifierProvider.notifier).addPoint(point);
    await _updateAnnotations();
  }

  Future<void> _updateAnnotations() async {
    final points = ref.read(mapCalculatorNotifierProvider).points;
    final annManager = _annotationManager;
    final polyManager = _polylineManager;
    if (annManager == null || polyManager == null) return;

    await annManager.deleteAll();
    await polyManager.deleteAll();

    for (final p in points) {
      await annManager.create(
        PointAnnotationOptions(
          geometry: Point(coordinates: Position(p.longitude, p.latitude)),
          iconSize: 1.2,
        ),
      );
    }

    if (points.length >= 2) {
      final coords = [
        ...points.map((p) => Position(p.longitude, p.latitude)),
        Position(points.first.longitude, points.first.latitude),
      ];
      await polyManager.create(
        PolylineAnnotationOptions(
          geometry: LineString(coordinates: coords),
          lineColor: 0xFF26A69A,
          lineWidth: 2.5,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mapCalculatorNotifierProvider);
    final notifier = ref.read(mapCalculatorNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('মানচিত্র হিসাবক'),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: state.points.isNotEmpty
                ? () async {
                    notifier.undoLastPoint();
                    await _updateAnnotations();
                  }
                : null,
            tooltip: 'শেষ বিন্দু বাদ দিন',
          ),
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: state.points.isNotEmpty
                ? () async {
                    notifier.clearPoints();
                    await _updateAnnotations();
                  }
                : null,
            tooltip: 'সব মুছুন',
          ),
        ],
      ),
      body: Stack(
        children: [
          MapWidget(
            onMapCreated: _onMapCreated,
            // ignore: deprecated_member_use
            onTapListener: _onMapTap,
            viewport: CameraViewportState(
              center: Point(
                coordinates: Position(
                  AppConstants.defaultMapLongitude,
                  AppConstants.defaultMapLatitude,
                ),
              ),
              zoom: AppConstants.defaultMapZoom,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomPanel(state: state, notifier: notifier),
          ),
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withAlpha(220),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  state.points.isEmpty
                      ? 'বিন্দু যোগ করতে মানচিত্রে ট্যাপ করুন'
                      : '${state.points.length} টি বিন্দু যোগ হয়েছে',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomPanel extends StatelessWidget {
  const _BottomPanel({required this.state, required this.notifier});

  final MapCalculatorState state;
  final MapCalculatorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          if (state.points.length >= 3) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ক্ষেত্রফল',
                          style: Theme.of(context).textTheme.labelMedium),
                      Text(
                        '${NumberFormatter.format(notifier.displayValue)} ${state.displayUnit.labelBn}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                ),
                      ),
                    ],
                  ),
                ),
                DropdownButton<AreaUnit>(
                  value: state.displayUnit,
                  underline: const SizedBox.shrink(),
                  items: AreaUnit.values
                      .map((u) =>
                          DropdownMenuItem(value: u, child: Text(u.labelBn)))
                      .toList(),
                  onChanged: (u) {
                    if (u != null) notifier.setDisplayUnit(u);
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: state.isSaving ? null : notifier.saveToHistory,
              icon: state.isSaving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save_outlined),
              label: Text(state.isSaving ? 'সংরক্ষণ হচ্ছে...' : 'ইতিহাসে সংরক্ষণ'),
            ),
          ] else
            Text(
              'ক্ষেত্রফল গণনার জন্য কমপক্ষে ৩টি বিন্দু যোগ করুন',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                state.errorMessage!,
                style: TextStyle(color: colorScheme.error),
              ),
            ),
        ],
      ),
    );
  }
}
