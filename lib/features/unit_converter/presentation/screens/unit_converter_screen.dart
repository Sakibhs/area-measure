import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/number_formatter.dart';
import 'package:area_and_plot/core/widgets/app_drawer.dart';
import 'package:area_and_plot/features/unit_converter/presentation/providers/unit_converter_provider.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnitConverterScreen extends ConsumerWidget {
  const UnitConverterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(unitConverterNotifierProvider);
    final notifier = ref.read(unitConverterNotifierProvider.notifier);
    final l = AppLocalizations.of(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: Text(l.unitConverter)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _InfoCard(),
            const SizedBox(height: 16),
            _InputSection(
              state: state,
              notifier: notifier,
            ),
            const SizedBox(height: 24),
            if (state.inputValue > 0) ...[
              Text(l.allConversionsLabel,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              ...AreaUnit.values.map(
                (unit) => _ConversionRow(
                  unit: unit,
                  value: state.allResults[unit] ?? 0,
                  isHighlighted: unit == state.toUnit,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).bangladeshUnits,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            const SizedBox(height: 4),
            Text('${AppLocalizations.of(context).kathaInfo} | ${AppLocalizations.of(context).bighaInfo}'),
            Text('${AppLocalizations.of(context).decimalInfo} | ${AppLocalizations.of(context).acreInfo}'),
          ],
        ),
      ),
    );
  }
}

class _InputSection extends StatefulWidget {
  const _InputSection({required this.state, required this.notifier});

  final UnitConverterState state;
  final UnitConverterNotifier notifier;

  @override
  State<_InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<_InputSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).enterValue,
            prefixIcon: const Icon(Icons.straighten_outlined),
          ),
          onChanged: (text) {
            final value = double.tryParse(text) ?? 0.0;
            widget.notifier.setInputValue(value);
          },
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _UnitDropdown(
                label: AppLocalizations.of(context).from,
                value: widget.state.fromUnit,
                onChanged: widget.notifier.setFromUnit,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.primary),
            ),
            Expanded(
              child: _UnitDropdown(
                label: AppLocalizations.of(context).to,
                value: widget.state.toUnit,
                onChanged: widget.notifier.setToUnit,
              ),
            ),
          ],
        ),
        if (widget.state.inputValue > 0) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  NumberFormatter.format(widget.notifier.singleResult),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.state.toUnit.label(AppLocalizations.of(context).localeName),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _UnitDropdown extends StatelessWidget {
  const _UnitDropdown({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final AreaUnit value;
  final ValueChanged<AreaUnit> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InputDecorator(
      decoration: InputDecoration(labelText: label),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<AreaUnit>(
          value: value,
          isDense: true,
          isExpanded: true,
          style: theme.textTheme.bodyMedium,
          items: AreaUnit.values
              .map((u) => DropdownMenuItem(value: u, child: Text(u.label(AppLocalizations.of(context).localeName))))
              .toList(),
          onChanged: (u) {
            if (u != null) onChanged(u);
          },
        ),
      ),
    );
  }
}

class _ConversionRow extends StatelessWidget {
  const _ConversionRow({
    required this.unit,
    required this.value,
    required this.isHighlighted,
  });

  final AreaUnit unit;
  final double value;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isHighlighted
            ? colorScheme.primaryContainer
            : colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        border: isHighlighted
            ? Border.all(color: colorScheme.primary, width: 1.5)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            unit.label(AppLocalizations.of(context).localeName),
            style: TextStyle(
              fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.normal,
              color: isHighlighted ? colorScheme.primary : null,
            ),
          ),
          Text(
            NumberFormatter.format(value),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: isHighlighted ? colorScheme.primary : null,
            ),
          ),
        ],
      ),
    );
  }
}
