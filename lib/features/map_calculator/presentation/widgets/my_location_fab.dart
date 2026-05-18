import 'package:area_and_plot/features/map_calculator/data/services/location_service.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MyLocationFab extends StatefulWidget {
  const MyLocationFab({
    super.key,
    required this.onLocationFound,
    this.heroTag = 'map_my_location_fab',
  });

  final ValueChanged<LatLng> onLocationFound;
  final Object heroTag;

  @override
  State<MyLocationFab> createState() => _MyLocationFabState();
}

class _MyLocationFabState extends State<MyLocationFab> {
  static const _service = LocationService();

  bool _loading = false;

  Future<void> _handleTap() async {
    if (_loading) return;
    setState(() => _loading = true);

    final result = await _service.getCurrentLocation();

    if (!mounted) return;
    setState(() => _loading = false);

    if (result.isSuccess) {
      widget.onLocationFound(result.position!);
      return;
    }

    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final message = switch (result.error!) {
      LocationErrorKind.serviceDisabled => l.locationServicesDisabled,
      LocationErrorKind.permissionDenied => l.permissionDenied,
      LocationErrorKind.failed => l.locationUnavailable,
    };
    messenger.showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return FloatingActionButton.small(
      heroTag: widget.heroTag,
      tooltip: l.myLocation,
      onPressed: _loading ? null : _handleTap,
      child: _loading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.my_location),
    );
  }
}
