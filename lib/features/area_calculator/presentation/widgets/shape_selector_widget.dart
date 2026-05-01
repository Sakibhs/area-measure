import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ShapeSelectorWidget extends StatelessWidget {
  const ShapeSelectorWidget({
    super.key,
    required this.selectedShape,
    required this.onShapeSelected,
  });

  final AreaShape selectedShape;
  final ValueChanged<AreaShape> onShapeSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context).selectShape, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Row(
          children: AreaShape.values.map((shape) {
            final isSelected = shape == selectedShape;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _ShapeCard(
                  shape: shape,
                  isSelected: isSelected,
                  onTap: () => onShapeSelected(shape),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _ShapeCard extends StatelessWidget {
  const _ShapeCard({
    required this.shape,
    required this.isSelected,
    required this.onTap,
  });

  final AreaShape shape;
  final bool isSelected;
  final VoidCallback onTap;

  IconData get _icon {
    switch (shape) {
      case AreaShape.rectangle:
        return Icons.rectangle_outlined;
      case AreaShape.triangle:
        return Icons.change_history_outlined;
      case AreaShape.polygon:
        return Icons.pentagon_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primaryContainer : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? colorScheme.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              _icon,
              color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              shape.label(AppLocalizations.of(context).localeName),
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
