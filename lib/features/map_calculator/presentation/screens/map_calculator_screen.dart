import 'package:area_and_plot/features/map_calculator/presentation/providers/map_calculator_provider.dart';
import 'package:area_and_plot/features/map_calculator/presentation/widgets/map_bottom_panel.dart';
import 'package:area_and_plot/features/map_calculator/presentation/widgets/map_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapCalculatorScreen extends ConsumerWidget {
  const MapCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapCalculatorNotifierProvider);
    final notifier = ref.read(mapCalculatorNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('মানচিত্র হিসাবক'),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: state.points.isNotEmpty ? notifier.undoLastPoint : null,
            tooltip: 'শেষ বিন্দু বাদ দিন',
          ),
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: state.points.isNotEmpty ? notifier.clearPoints : null,
            tooltip: 'সব মুছুন',
          ),
        ],
      ),
      body: Stack(
        children: [
          const MapViewWidget(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MapBottomPanel(state: state, notifier: notifier),
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
