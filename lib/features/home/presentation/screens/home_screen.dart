import 'package:area_and_plot/core/theme/app_colors.dart';
import 'package:area_and_plot/core/widgets/app_drawer.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(l.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showUnitsInfo(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _WelcomeBanner(),
            const SizedBox(height: 24),
            Text(l.features, style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _FeatureCard(
                  icon: Icons.calculate,
                  title: l.featureAreaCalculator,
                  subtitle: l.featureAreaCalculatorDesc,
                  color: AppColors.primaryLight,
                  onTap: () => context.go('/calculator'),
                ),
                _FeatureCard(
                  icon: Icons.map,
                  title: l.featureMapCalculator,
                  subtitle: l.featureMapCalculatorDesc,
                  color: const Color(0xFF00897B),
                  onTap: () => context.go('/map'),
                ),
                _FeatureCard(
                  icon: Icons.swap_horiz,
                  title: l.featureUnitConverter,
                  subtitle: l.featureUnitConverterDesc,
                  color: AppColors.secondary,
                  onTap: () => context.go('/converter'),
                ),
                _FeatureCard(
                  icon: Icons.history,
                  title: l.featureHistory,
                  subtitle: l.featureHistoryDesc,
                  color: const Color(0xFF6D4C41),
                  onTap: () => context.go('/history'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const _QuickReferenceCard(),
          ],
        ),
      ),
    );
  }

  void _showUnitsInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => const _UnitsInfoSheet(),
    );
  }
}

class _WelcomeBanner extends StatelessWidget {
  const _WelcomeBanner();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.landscape, color: Colors.white, size: 36),
          const SizedBox(height: 8),
          Text(
            l.welcome,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            l.welcomeSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const Spacer(),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickReferenceCard extends StatelessWidget {
  const _QuickReferenceCard();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final items = [l.kathaInfo, l.bighaInfo, l.decimalInfo, l.acreInfo];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.info_outline, size: 18),
                const SizedBox(width: 8),
                Text(l.bangladeshUnits,
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const Divider(height: 16),
            ...items.map(
              (info) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text('• $info'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnitsInfoSheet extends StatelessWidget {
  const _UnitsInfoSheet();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l.unitsInfo, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text('• ${l.kathaInfo}'),
          const SizedBox(height: 8),
          Text('• ${l.bighaInfo}'),
          const SizedBox(height: 8),
          Text('• ${l.decimalInfo}'),
          const SizedBox(height: 8),
          Text('• ${l.acreInfo}'),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l.close),
            ),
          ),
        ],
      ),
    );
  }
}
