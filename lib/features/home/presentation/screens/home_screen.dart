import 'package:area_and_plot/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('জমির হিসাব'),
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
            _WelcomeBanner(colorScheme: colorScheme),
            const SizedBox(height: 24),
            Text('বৈশিষ্ট্যসমূহ', style: theme.textTheme.titleLarge),
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
                  title: 'ক্ষেত্রফল হিসাবক',
                  subtitle: 'যেকোনো আকৃতির ক্ষেত্রফল',
                  color: AppColors.primaryLight,
                  onTap: () => context.go('/calculator'),
                ),
                _FeatureCard(
                  icon: Icons.map,
                  title: 'মানচিত্র হিসাবক',
                  subtitle: 'মানচিত্রে এঁকে জমি মাপুন',
                  color: const Color(0xFF00897B),
                  onTap: () => context.go('/map'),
                ),
                _FeatureCard(
                  icon: Icons.swap_horiz,
                  title: 'একক রূপান্তর',
                  subtitle: 'জমির একক পরিবর্তন',
                  color: AppColors.secondary,
                  onTap: () => context.go('/converter'),
                ),
                _FeatureCard(
                  icon: Icons.history,
                  title: 'ইতিহাস',
                  subtitle: 'সংরক্ষিত হিসাব দেখুন',
                  color: const Color(0xFF6D4C41),
                  onTap: () => context.go('/history'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _QuickReferenceCard(),
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
  const _WelcomeBanner({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
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
            'স্বাগতম!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'বাংলাদেশের জন্য তৈরি জমি পরিমাপ অ্যাপ',
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
  @override
  Widget build(BuildContext context) {
    final rows = [
      ('১ কাঠা', '৭২০ বর্গফুট'),
      ('১ বিঘা', '২০ কাঠা = ১৪,৪০০ বর্গফুট'),
      ('১ ডেসিমাল', '৪৩৫.৫৬ বর্গফুট'),
      ('১ একর', '৪৩,৫৬০ বর্গফুট'),
    ];
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
                Text('বাংলাদেশ মান',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const Divider(height: 16),
            ...rows.map(
              (r) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(r.$1,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text(r.$2,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant)),
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

class _UnitsInfoSheet extends StatelessWidget {
  const _UnitsInfoSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('একক পরিচিতি',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          const Text('• ১ কাঠা = ৭২০ বর্গফুট (বাংলাদেশ মান)'),
          const SizedBox(height: 8),
          const Text('• ১ বিঘা = ২০ কাঠা = ১৪,৪০০ বর্গফুট'),
          const SizedBox(height: 8),
          const Text('• ১ ডেসিমাল = ৪৩৫.৫৬ বর্গফুট (১/১০০ একর)'),
          const SizedBox(height: 8),
          const Text('• ১ একর = ৪৩,৫৬০ বর্গফুট'),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('বন্ধ করুন'),
            ),
          ),
        ],
      ),
    );
  }
}
