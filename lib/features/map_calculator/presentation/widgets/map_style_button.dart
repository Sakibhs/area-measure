import 'package:area_and_plot/features/map_calculator/presentation/providers/map_style_provider.dart';
import 'package:flutter/material.dart';

class MapStyleButton extends StatelessWidget {
  const MapStyleButton({
    super.key,
    required this.current,
    required this.onSelected,
  });

  final MapStyle current;
  final ValueChanged<MapStyle> onSelected;

  Future<void> _showMenu(BuildContext context, Offset tapPosition) async {
    final colorScheme = Theme.of(context).colorScheme;
    final screenSize = MediaQuery.of(context).size;
    final result = await showMenu<MapStyle>(
      context: context,
      position: RelativeRect.fromLTRB(
        tapPosition.dx,
        tapPosition.dy,
        screenSize.width - tapPosition.dx,
        screenSize.height - tapPosition.dy,
      ),
      items: [
        PopupMenuItem(
          value: MapStyle.street,
          child: Row(
            children: [
              Icon(
                Icons.map_outlined,
                size: 18,
                color: current == MapStyle.street ? colorScheme.primary : null,
              ),
              const SizedBox(width: 8),
              const Text('Street'),
            ],
          ),
        ),
        PopupMenuItem(
          value: MapStyle.satellite,
          child: Row(
            children: [
              Icon(
                Icons.satellite_alt,
                size: 18,
                color:
                    current == MapStyle.satellite ? colorScheme.primary : null,
              ),
              const SizedBox(width: 8),
              const Text('Satellite'),
            ],
          ),
        ),
      ],
    );
    if (result != null) onSelected(result);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapUp: (details) => _showMenu(context, details.globalPosition),
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: const Icon(Icons.more_vert, size: 20, color: Colors.black87),
      ),
    );
  }
}
