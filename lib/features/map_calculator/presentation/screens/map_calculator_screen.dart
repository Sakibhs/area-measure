import 'package:area_and_plot/features/auth/presentation/providers/auth_provider.dart';
import 'package:area_and_plot/features/map_calculator/data/services/location_service.dart';
import 'package:area_and_plot/features/map_calculator/presentation/providers/map_calculator_provider.dart';
import 'package:area_and_plot/features/map_calculator/presentation/providers/map_camera_provider.dart';
import 'package:area_and_plot/features/map_calculator/presentation/widgets/map_save_form.dart';
import 'package:area_and_plot/features/map_calculator/presentation/widgets/map_view_widget.dart';
import 'package:area_and_plot/features/map_calculator/presentation/widgets/my_location_fab.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class MapCalculatorScreen extends ConsumerStatefulWidget {
  const MapCalculatorScreen({super.key});

  @override
  ConsumerState<MapCalculatorScreen> createState() =>
      _MapCalculatorScreenState();
}

class _MapCalculatorScreenState extends ConsumerState<MapCalculatorScreen> {
  static const _myLocationZoom = 17.0;
  static const _locationService = LocationService();

  late final MapController _mapController = MapController();
  bool _initialCameraApplied = false;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _moveTo(LatLng latLng) {
    _mapController.move(latLng, _myLocationZoom);
  }

  Future<void> _handleSaveTap({
    required MeasureMode mode,
    required double areaInSqFt,
    required double distanceMeters,
  }) async {
    final signedIn = ref.read(authStateProvider).valueOrNull != null;
    if (signedIn) {
      _openSaveForm(context, mode, areaInSqFt, distanceMeters);
      return;
    }

    await ref.read(authNotifierProvider.notifier).signIn();
    if (!mounted) return;

    final hadError = ref.read(authNotifierProvider).error != null;
    if (hadError) {
      final l = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.loginRequiredToSave),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    _openSaveForm(context, mode, areaInSqFt, distanceMeters);
  }

  Future<void> _handleMapReady() async {
    if (_initialCameraApplied) return;
    _initialCameraApplied = true;

    final cached = await ref.read(mapCameraNotifierProvider.future);
    if (!mounted) return;

    if (cached != null) {
      _mapController.move(
        LatLng(cached.latitude, cached.longitude),
        cached.zoom,
      );
      return;
    }

    // First launch — silently try to center on the user's current location.
    final result = await _locationService.getCurrentLocation();
    if (!mounted || !result.isSuccess) return;
    _mapController.move(result.position!, _myLocationZoom);
    ref
        .read(mapCameraNotifierProvider.notifier)
        .save(result.position!, _myLocationZoom);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mapCalculatorNotifierProvider);
    final notifier = ref.read(mapCalculatorNotifierProvider.notifier);
    final l = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    final mode = state.mode;
    final hasMode = mode != null;

    final canSave = hasMode &&
        ((mode == MeasureMode.area && state.points.length >= 3) ||
            (mode == MeasureMode.distance && state.points.length >= 2));

    final showHint = hasMode && state.points.length < 3;
    final showDistanceBar =
        mode == MeasureMode.distance && state.points.isNotEmpty;

    return Scaffold(
      body: Stack(
        children: [
          MapViewWidget(
            controller: _mapController,
            onMapReady: _handleMapReady,
          ),
          if (showDistanceBar)
            _DistanceTopBar(
              meters: notifier.totalDistanceMeters,
              pointCount: state.points.length,
              label: l.totalDistance,
            ),
          if (showHint)
            Positioned(
              bottom: 16,
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
                    _hintText(l, mode, state.points.length),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 16,
            left: 16,
            child: hasMode
                ? FloatingActionButton.small(
                    heroTag: 'map_cancel_fab',
                    tooltip: l.clearPoints,
                    backgroundColor: colorScheme.errorContainer,
                    foregroundColor: colorScheme.onErrorContainer,
                    onPressed: notifier.clearPoints,
                    child: const Icon(Icons.close),
                  )
                : FloatingActionButton.small(
                    heroTag: 'map_add_fab',
                    tooltip: l.addMeasurement,
                    onPressed: () => _openModePicker(context, notifier),
                    child: const Icon(Icons.add),
                  ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyLocationFab(onLocationFound: _moveTo),
                if (canSave) ...[
                  const SizedBox(height: 12),
                  FloatingActionButton.small(
                    heroTag: 'map_save_fab',
                    tooltip: l.save,
                    onPressed: () => _handleSaveTap(
                      mode: mode,
                      areaInSqFt: state.areaInSqFt,
                      distanceMeters: notifier.totalDistanceMeters,
                    ),
                    child: const Icon(Icons.save_outlined),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _hintText(AppLocalizations l, MeasureMode mode, int pointCount) {
    if (pointCount == 0) {
      return mode == MeasureMode.distance
          ? l.tapToAddDistancePoints
          : l.tapToAddPoints;
    }
    return l.pointsAdded(pointCount);
  }

  void _openModePicker(
    BuildContext context,
    MapCalculatorNotifier notifier,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        final l = AppLocalizations.of(sheetContext);
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(sheetContext)
                      .colorScheme
                      .onSurfaceVariant
                      .withAlpha(80),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.crop_square),
                title: Text(l.areaMeasure),
                subtitle: Text(l.areaMeasureDesc),
                onTap: () {
                  Navigator.pop(sheetContext);
                  notifier.setMode(MeasureMode.area);
                },
              ),
              ListTile(
                leading: const Icon(Icons.timeline),
                title: Text(l.distanceMeasure),
                subtitle: Text(l.distanceMeasureDesc),
                onTap: () {
                  Navigator.pop(sheetContext);
                  notifier.setMode(MeasureMode.distance);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  void _openSaveForm(
    BuildContext context,
    MeasureMode mode,
    double areaInSqFt,
    double distanceMeters,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => MapSaveForm(
        mode: mode,
        areaInSqFt: areaInSqFt,
        distanceMeters: distanceMeters,
      ),
    );
  }
}

class _DistanceTopBar extends StatelessWidget {
  const _DistanceTopBar({
    required this.meters,
    required this.pointCount,
    required this.label,
  });

  final double meters;
  final int pointCount;
  final String label;

  String _format(double m) {
    if (m >= 1000) return '${(m / 1000).toStringAsFixed(2)} km';
    return '${m.toStringAsFixed(1)} m';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final mq = MediaQuery.of(context);
    return Positioned(
      top: mq.padding.top + 12,
      left: 12,
      right: 60,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: cs.surface.withAlpha(230),
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.timeline, color: cs.primary, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                  ),
                  Text(
                    _format(meters),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              '$pointCount',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: cs.primary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Icon(Icons.place, color: cs.primary, size: 18),
          ],
        ),
      ),
    );
  }
}
