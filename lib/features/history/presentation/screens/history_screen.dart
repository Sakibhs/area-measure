import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/core/utils/area_converter.dart';
import 'package:area_and_plot/core/utils/number_formatter.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:area_and_plot/features/history/presentation/providers/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('হিসাবের ইতিহাস'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'সব'),
            Tab(text: 'প্রিয়'),
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
    final async = ref.watch(provider);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('ত্রুটি: $e')),
      data: (entries) {
        if (entries.isEmpty) {
          return const _EmptyState();
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(historyNotifierProvider),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _HistoryCard(
              entry: entries[i],
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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('মুছে ফেলুন?'),
        content: const Text('এই হিসাবটি মুছে ফেলতে চান?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('বাতিল')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('মুছুন')),
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
    required this.onDelete,
    required this.onToggleFavorite,
  });

  final HistoryEntry entry;
  final VoidCallback onDelete;
  final VoidCallback onToggleFavorite;

  String get _shapeLabel {
    final shape = entry.shape;
    if (shape == null) return 'মানচিত্র';
    return shape.labelBn;
  }

  String get _areaDisplay {
    final value = AreaConverter.convert(
      value: entry.areaInSqFt,
      from: AreaUnit.squareFeet,
      to: entry.displayUnit,
    );
    return '${NumberFormatter.format(value)} ${entry.displayUnit.labelBn}';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dateStr = DateFormat('dd MMM yyyy, hh:mm a').format(entry.createdAt);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: entry.type == HistoryType.mapCalculator
                    ? colorScheme.tertiaryContainer
                    : colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                entry.type == HistoryType.mapCalculator
                    ? Icons.map_outlined
                    : Icons.calculate_outlined,
                color: entry.type == HistoryType.mapCalculator
                    ? colorScheme.onTertiaryContainer
                    : colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _shapeLabel,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                  ),
                  Text(
                    _areaDisplay,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_outlined,
              size: 80, color: Theme.of(context).colorScheme.outlineVariant),
          const SizedBox(height: 16),
          Text('কোনো সংরক্ষিত হিসাব নেই',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text('আপনার হিসাব এখানে দেখাবে',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  )),
        ],
      ),
    );
  }
}
