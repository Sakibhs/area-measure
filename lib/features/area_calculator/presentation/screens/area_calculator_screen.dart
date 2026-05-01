import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/number_formatter.dart';
import 'package:area_and_plot/core/widgets/app_drawer.dart';
import 'package:area_and_plot/features/area_calculator/presentation/providers/area_calculator_provider.dart';
import 'package:area_and_plot/features/area_calculator/presentation/widgets/dimension_input_widget.dart';
import 'package:area_and_plot/features/area_calculator/presentation/widgets/shape_selector_widget.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
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
    final l = AppLocalizations.of(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(l.areaCalculator),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: notifier.reset,
            tooltip: l.reset,
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
              label: Text(l.calculate),
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
                label: Text(state.isSaving ? l.saving : l.saveResult),
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
        Text(AppLocalizations.of(context).selectUnitLabel, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: AreaUnit.values.map((unit) {
            return ChoiceChip(
              label: Text(unit.label(AppLocalizations.of(context).localeName)),
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
              AppLocalizations.of(context).result,
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
              state.displayUnit.label(AppLocalizations.of(context).localeName),
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
            Text(AppLocalizations.of(context).allUnitsLabel, style: Theme.of(context).textTheme.titleMedium),
            const Divider(),
            ...AreaUnit.values.map(
              (unit) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(unit.label(AppLocalizations.of(context).localeName)),
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
