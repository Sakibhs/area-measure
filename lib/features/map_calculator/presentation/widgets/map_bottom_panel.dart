import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/number_formatter.dart';
import 'package:area_and_plot/features/map_calculator/presentation/providers/map_calculator_provider.dart';
import 'package:flutter/material.dart';

class MapBottomPanel extends StatelessWidget {
  const MapBottomPanel({
    super.key,
    required this.state,
    required this.notifier,
  });

  final MapCalculatorState state;
  final MapCalculatorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          if (state.points.length >= 3) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ক্ষেত্রফল',
                          style: Theme.of(context).textTheme.labelMedium),
                      Text(
                        '${NumberFormatter.format(notifier.displayValue)} ${state.displayUnit.labelBn}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                ),
                DropdownButton<AreaUnit>(
                  value: state.displayUnit,
                  underline: const SizedBox.shrink(),
                  items: AreaUnit.values
                      .map((u) => DropdownMenuItem(
                          value: u, child: Text(u.labelBn)))
                      .toList(),
                  onChanged: (u) {
                    if (u != null) notifier.setDisplayUnit(u);
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: state.isSaving ? null : notifier.saveToHistory,
              icon: state.isSaving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save_outlined),
              label: Text(
                  state.isSaving ? 'সংরক্ষণ হচ্ছে...' : 'ইতিহাসে সংরক্ষণ'),
            ),
          ] else
            Text(
              'ক্ষেত্রফল গণনার জন্য কমপক্ষে ৩টি বিন্দু যোগ করুন',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                state.errorMessage!,
                style: TextStyle(color: colorScheme.error),
              ),
            ),
        ],
      ),
    );
  }
}
