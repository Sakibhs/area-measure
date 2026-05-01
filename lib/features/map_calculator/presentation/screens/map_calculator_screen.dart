import 'package:area_and_plot/features/map_calculator/presentation/providers/map_calculator_provider.dart';
import 'package:area_and_plot/features/map_calculator/presentation/widgets/map_bottom_panel.dart';
import 'package:area_and_plot/features/map_calculator/presentation/widgets/map_view_widget.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapCalculatorScreen extends ConsumerWidget {
  const MapCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapCalculatorNotifierProvider);
    final notifier = ref.read(mapCalculatorNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          const MapViewWidget(),
          if (state.points.length >= 3)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MapBottomPanel(state: state, notifier: notifier),
            ),
          if (state.points.length < 3)
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
                    state.points.isEmpty
                        ? l.tapToAddPoints
                        : l.pointsAdded(state.points.length),
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
