import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/number_formatter.dart';
import 'package:area_and_plot/features/area_calculator/presentation/providers/area_calculator_provider.dart';
import 'package:area_and_plot/features/area_calculator/presentation/widgets/dimension_input_widget.dart';
import 'package:area_and_plot/features/area_calculator/presentation/widgets/shape_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AreaCalculatorScreen extends ConsumerWidget {
  const AreaCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(areaCalculatorNotifierProvider);
    final notifier = ref.read(areaCalculatorNotifierProvider.notifier);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ক্ষেত্রফল হিসাবক'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: notifier.reset,
            tooltip: 'Reset',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShapeSelectorWidget(
              selectedShape: state.shape,
              onShapeSelected: notifier.setShape,
            ),
            const SizedBox(height: 16),
            DimensionInputWidget(
              shape: state.shape,
              dimensions: state.dimensions,
              onDimensionChanged: notifier.setDimension,
              onAddVertex: notifier.addPolygonVertex,
              onRemoveVertex: notifier.removePolygonVertex,
            ),
            const SizedBox(height: 16),
            _UnitSelector(
              selected: state.displayUnit,
              onChanged: notifier.setDisplayUnit,
            ),
            const SizedBox(height: 16),
            if (state.errorMessage != null)
              _ErrorBanner(message: state.errorMessage!),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: notifier.calculate,
              icon: const Icon(Icons.calculate),
              label: const Text('হিসাব করুন'),
            ),
            if (state.result != null) ...[
              const SizedBox(height: 24),
              _ResultCard(
                notifier: notifier,
                state: state,
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 12),
              _AllUnitsCard(notifier: notifier),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: state.isSaving ? null : notifier.saveResult,
                icon: state.isSaving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save_outlined),
                label: Text(state.isSaving ? 'সংরক্ষণ হচ্ছে...' : 'ইতিহাসে সংরক্ষণ'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _UnitSelector extends StatelessWidget {
  const _UnitSelector({required this.selected, required this.onChanged});

  final AreaUnit selected;
  final ValueChanged<AreaUnit> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('একক নির্বাচন', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: AreaUnit.values.map((unit) {
            return ChoiceChip(
              label: Text(unit.labelBn),
              selected: selected == unit,
              onSelected: (_) => onChanged(unit),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.notifier,
    required this.state,
    required this.colorScheme,
  });

  final AreaCalculatorNotifier notifier;
  final AreaCalculatorState state;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final value = notifier.displayValue;
    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'ফলাফল',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              NumberFormatter.format(value),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              state.displayUnit.labelBn,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AllUnitsCard extends StatelessWidget {
  const _AllUnitsCard({required this.notifier});

  final AreaCalculatorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final values = notifier.allUnitValues;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('সব এককে', style: Theme.of(context).textTheme.titleMedium),
            const Divider(),
            ...AreaUnit.values.map(
              (unit) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(unit.labelBn),
                    Text(
                      NumberFormatter.format(values[unit] ?? 0),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline,
              color: Theme.of(context).colorScheme.onErrorContainer),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }
}
