import 'package:area_and_plot/core/di/locale_provider.dart';
import 'package:area_and_plot/core/theme/app_colors.dart';
import 'package:area_and_plot/features/auth/domain/entities/app_user.dart';
import 'package:area_and_plot/features/auth/presentation/providers/auth_provider.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final l = AppLocalizations.of(context);
    final user = ref.watch(authStateProvider).valueOrNull;
    final authAction = ref.watch(authNotifierProvider);

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _UserHeader(
              user: user,
              appName: l.appName,
              loginText: l.loginToSyncText,
            ),
            if (user == null) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: _SignInButton(
                  isLoading: authAction.isLoading,
                  label: l.signIn,
                  onTap: () =>
                      ref.read(authNotifierProvider.notifier).signIn(),
                ),
              ),
              const Divider(height: 1),
            ],
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
            if (user != null) ...[
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: Row(
                  children: [
                    Icon(Icons.account_circle_outlined,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      l.account,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: authAction.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.logout),
                title: Text(l.signOut),
                onTap: authAction.isLoading
                    ? null
                    : () =>
                        ref.read(authNotifierProvider.notifier).signOut(),
              ),
            ],
            if (authAction.error != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  authAction.error!,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _UserHeader extends StatelessWidget {
  const _UserHeader({
    required this.user,
    required this.appName,
    this.loginText,
  });

  final AppUser? user;
  final String appName;
  final String? loginText;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return UserAccountsDrawerHeader(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primaryLight],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        currentAccountPicture: CircleAvatar(
          radius: 34,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 31,
            backgroundColor: Colors.white24,
            backgroundImage: user!.photoUrl != null
                ? NetworkImage(user!.photoUrl!)
                : null,
            child: user!.photoUrl == null
                ? Text(
                    user!.initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )
                : null,
          ),
        ),
        accountName: Text(
          user!.displayName ?? user!.email.split('@').first,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        accountEmail: Text(
          user!.email,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      );
    }

    return DrawerHeader(
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
            appName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (loginText != null) ...[
            const SizedBox(height: 4),
            Text(
              loginText!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white70),
            ),
          ],
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    required this.isLoading,
    required this.label,
    required this.onTap,
  });

  final bool isLoading;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            const Text(
              'G',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
