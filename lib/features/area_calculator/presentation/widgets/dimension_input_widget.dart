import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DimensionInputWidget extends StatelessWidget {
  const DimensionInputWidget({
    super.key,
    required this.shape,
    required this.dimensions,
    required this.onDimensionChanged,
    required this.onAddVertex,
    required this.onRemoveVertex,
  });

  final AreaShape shape;
  final List<double> dimensions;
  final void Function(int index, double value) onDimensionChanged;
  final VoidCallback onAddVertex;
  final VoidCallback onRemoveVertex;

  @override
  Widget build(BuildContext context) {
    return switch (shape) {
      AreaShape.rectangle => _RectangleInputs(
          dimensions: dimensions,
          onChanged: onDimensionChanged,
        ),
      AreaShape.triangle => _TriangleInputs(
          dimensions: dimensions,
          onChanged: onDimensionChanged,
        ),
      AreaShape.polygon => _PolygonInputs(
          dimensions: dimensions,
          onChanged: onDimensionChanged,
          onAddVertex: onAddVertex,
          onRemoveVertex: onRemoveVertex,
        ),
    };
  }
}

class _RectangleInputs extends StatelessWidget {
  const _RectangleInputs({required this.dimensions, required this.onChanged});

  final List<double> dimensions;
  final void Function(int, double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NumericField(
          label: '${AppLocalizations.of(context).width} (ft)',
          value: dimensions.isNotEmpty ? dimensions[0] : 0,
          onChanged: (v) => onChanged(0, v),
        ),
        const SizedBox(height: 12),
        _NumericField(
          label: '${AppLocalizations.of(context).length} (ft)',
          value: dimensions.length > 1 ? dimensions[1] : 0,
          onChanged: (v) => onChanged(1, v),
        ),
      ],
    );
  }
}

class _TriangleInputs extends StatelessWidget {
  const _TriangleInputs({required this.dimensions, required this.onChanged});

  final List<double> dimensions;
  final void Function(int, double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NumericField(
          label: '${AppLocalizations.of(context).base} (ft)',
          value: dimensions.isNotEmpty ? dimensions[0] : 0,
          onChanged: (v) => onChanged(0, v),
        ),
        const SizedBox(height: 12),
        _NumericField(
          label: '${AppLocalizations.of(context).height} (ft)',
          value: dimensions.length > 1 ? dimensions[1] : 0,
          onChanged: (v) => onChanged(1, v),
        ),
      ],
    );
  }
}

class _PolygonInputs extends StatelessWidget {
  const _PolygonInputs({
    required this.dimensions,
    required this.onChanged,
    required this.onAddVertex,
    required this.onRemoveVertex,
  });

  final List<double> dimensions;
  final void Function(int, double) onChanged;
  final VoidCallback onAddVertex;
  final VoidCallback onRemoveVertex;

  @override
  Widget build(BuildContext context) {
    final vertexCount = dimensions.length ~/ 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(AppLocalizations.of(context).verticesLabel(vertexCount),
                style: Theme.of(context).textTheme.labelLarge),
            const Spacer(),
            IconButton.outlined(
              onPressed: vertexCount > 3 ? onRemoveVertex : null,
              icon: const Icon(Icons.remove),
              tooltip: AppLocalizations.of(context).removeVertex,
            ),
            const SizedBox(width: 8),
            IconButton.outlined(
              onPressed: vertexCount < 20 ? onAddVertex : null,
              icon: const Icon(Icons.add),
              tooltip: AppLocalizations.of(context).addVertex,
            ),
          ],
        ),
        const SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: vertexCount,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final xIndex = i * 2;
            final yIndex = xIndex + 1;
            return Row(
              children: [
                Expanded(
                  child: _NumericField(
                    label: 'X${i + 1}',
                    value: dimensions[xIndex],
                    onChanged: (v) => onChanged(xIndex, v),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _NumericField(
                    label: 'Y${i + 1}',
                    value: dimensions[yIndex],
                    onChanged: (v) => onChanged(yIndex, v),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _NumericField extends StatefulWidget {
  const _NumericField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<_NumericField> createState() => _NumericFieldState();
}

class _NumericFieldState extends State<_NumericField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.value == 0 ? '' : widget.value.toString(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: widget.label,
        suffixText: 'ft',
      ),
      onChanged: (text) {
        final value = double.tryParse(text) ?? 0.0;
        widget.onChanged(value);
      },
    );
  }
}
