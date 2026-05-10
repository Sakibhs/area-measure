import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/area_converter.dart';
import 'package:area_and_plot/core/utils/number_formatter.dart';
import 'package:area_and_plot/core/widgets/app_drawer.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:area_and_plot/features/history/presentation/providers/history_provider.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(l.calculationHistory),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l.allHistory),
            Tab(text: l.favorites),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _HistoryList(provider: historyNotifierProvider),
          _HistoryList(provider: favoritesNotifierProvider),
        ],
      ),
    );
  }
}

class _HistoryList extends ConsumerWidget {
  const _HistoryList({required this.provider});

  final ProviderListenable<AsyncValue<List<HistoryEntry>>> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final async = ref.watch(provider);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('${l.error}: $e')),
      data: (entries) {
        if (entries.isEmpty) return const _EmptyState();
        return RefreshIndicator(
          onRefresh: () => ref.read(historyNotifierProvider.notifier).sync(),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _HistoryCard(
              entry: entries[i],
              onTap: () => context.push('/history/detail', extra: entries[i]),
              onDelete: () => _confirmDelete(context, ref, entries[i].id),
              onToggleFavorite: () => ref
                  .read(historyNotifierProvider.notifier)
                  .toggleFavorite(entries[i].id,
                      isFavorite: !entries[i].isFavorite),
            ),
          ),
        );
      },
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, String id) async {
    final l = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.deleteConfirmTitle),
        content: Text(l.deleteConfirmMessage),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l.delete)),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(historyNotifierProvider.notifier).delete(id);
    }
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({
    required this.entry,
    required this.onTap,
    required this.onDelete,
    required this.onToggleFavorite,
  });

  final HistoryEntry entry;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final dateStr = DateFormat('dd MMM yyyy, hh:mm a').format(entry.createdAt);

    final isDistance = entry.type == HistoryType.mapDistance;
    final shapeLabel = entry.shape == null
        ? (entry.label ?? (isDistance ? l.distance : l.map))
        : entry.shape!.label(l.localeName);
    final String areaDisplay;
    if (isDistance) {
      final meters = _distanceMeters(entry.mapPoints);
      areaDisplay = meters >= 1000
          ? '${(meters / 1000).toStringAsFixed(2)} km'
          : '${meters.toStringAsFixed(1)} m';
    } else {
      final areaValue = AreaConverter.convert(
        value: entry.areaInSqFt,
        from: AreaUnit.squareFeet,
        to: entry.displayUnit,
      );
      areaDisplay =
          '${NumberFormatter.format(areaValue)} ${entry.displayUnit.label(l.localeName)}';
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _iconBg(entry.type, colorScheme),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _iconFor(entry.type),
                color: _iconFg(entry.type, colorScheme),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shapeLabel,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                  ),
                  Text(
                    areaDisplay,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    dateStr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                entry.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: entry.isFavorite ? Colors.red : null,
              ),
              onPressed: onToggleFavorite,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              color: colorScheme.error,
              onPressed: onDelete,
            ),
          ],
        ),
        ),
      ),
    );
  }

  Color _iconBg(HistoryType type, ColorScheme cs) {
    switch (type) {
      case HistoryType.mapCalculator:
        return cs.tertiaryContainer;
      case HistoryType.mapDistance:
        return cs.secondaryContainer;
      case HistoryType.areaCalculator:
        return cs.primaryContainer;
    }
  }

  Color _iconFg(HistoryType type, ColorScheme cs) {
    switch (type) {
      case HistoryType.mapCalculator:
        return cs.onTertiaryContainer;
      case HistoryType.mapDistance:
        return cs.onSecondaryContainer;
      case HistoryType.areaCalculator:
        return cs.onPrimaryContainer;
    }
  }

  IconData _iconFor(HistoryType type) {
    switch (type) {
      case HistoryType.mapCalculator:
        return Icons.map_outlined;
      case HistoryType.mapDistance:
        return Icons.timeline;
      case HistoryType.areaCalculator:
        return Icons.calculate_outlined;
    }
  }

  static const _distance = Distance();

  double _distanceMeters(List<double>? flat) {
    if (flat == null || flat.length < 4) return 0.0;
    double sum = 0.0;
    for (int i = 0; i + 3 < flat.length; i += 2) {
      sum += _distance.as(
        LengthUnit.Meter,
        LatLng(flat[i], flat[i + 1]),
        LatLng(flat[i + 2], flat[i + 3]),
      );
    }
    return sum;
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_outlined,
              size: 80, color: Theme.of(context).colorScheme.outlineVariant),
          const SizedBox(height: 16),
          Text(l.noHistory, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            l.noHistorySubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
