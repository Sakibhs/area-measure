import 'package:area_and_plot/core/di/locale_provider.dart';
import 'package:area_and_plot/core/theme/app_colors.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final l = AppLocalizations.of(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.landscape, color: Colors.white, size: 40),
                  const SizedBox(height: 8),
                  Text(
                    l.appName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Row(
                children: [
                  Icon(Icons.language,
                      size: 18,
                      color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    l.language,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ),
            RadioGroup<Locale>(
              groupValue: locale,
              onChanged: (selected) {
                if (selected != null) {
                  ref.read(localeProvider.notifier).setLocale(selected);
                }
              },
              child: Column(
                children: [
                  RadioListTile<Locale>(
                    value: const Locale('en'),
                    title: Text(l.english),
                    secondary: const Text('EN',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  RadioListTile<Locale>(
                    value: const Locale('bn'),
                    title: Text(l.bengali),
                    secondary: const Text('বাং',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
