import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/area_converter.dart';
import 'package:area_and_plot/core/utils/number_formatter.dart';
import 'package:area_and_plot/features/map_calculator/presentation/providers/map_calculator_provider.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapSaveForm extends ConsumerStatefulWidget {
  const MapSaveForm({super.key, required this.areaInSqFt});

  final double areaInSqFt;

  @override
  ConsumerState<MapSaveForm> createState() => _MapSaveFormState();
}

class _MapSaveFormState extends ConsumerState<MapSaveForm> {
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  AreaUnit _unit = AreaUnit.squareFeet;
  bool _saving = false;
  bool _nameError = false;

  double get _displayArea => AreaConverter.convert(
        value: widget.areaInSqFt,
        from: AreaUnit.squareFeet,
        to: _unit,
      );

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_nameController.text.trim().isEmpty) {
      setState(() => _nameError = true);
      return;
    }
    setState(() => _saving = true);
    await ref.read(mapCalculatorNotifierProvider.notifier).saveToHistory(
          label: _nameController.text.trim(),
          notes: _notesController.text.trim().isEmpty
              ? null
              : _notesController.text.trim(),
          displayUnit: _unit,
        );
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          16, 12, 16, MediaQuery.of(context).viewInsets.bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: cs.onSurfaceVariant.withAlpha(80),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: l.plotName,
              errorText: _nameError ? l.errorPlotNameRequired : null,
            ),
            textCapitalization: TextCapitalization.words,
            onChanged: (_) {
              if (_nameError) setState(() => _nameError = false);
            },
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: l.area,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                  ),
                  child: Text(
                    NumberFormatter.format(_displayArea),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              DropdownButtonHideUnderline(
                child: DropdownButton<AreaUnit>(
                  value: _unit,
                  borderRadius: BorderRadius.circular(12),
                  items: AreaUnit.values
                      .map((u) => DropdownMenuItem(
                            value: u,
                            child: Text(u.label(l.localeName)),
                          ))
                      .toList(),
                  onChanged: (u) {
                    if (u != null) setState(() => _unit = u);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _notesController,
            decoration: InputDecoration(labelText: l.plotNotes),
            maxLines: 2,
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l.save),
          ),
        ],
      ),
    );
  }
}
