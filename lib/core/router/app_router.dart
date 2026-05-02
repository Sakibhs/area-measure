import 'package:area_and_plot/core/widgets/app_drawer.dart';
import 'package:area_and_plot/features/area_calculator/presentation/screens/area_calculator_screen.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:area_and_plot/features/history/presentation/screens/history_detail_screen.dart';
import 'package:area_and_plot/features/history/presentation/screens/history_screen.dart';
import 'package:area_and_plot/features/home/presentation/screens/home_screen.dart';
import 'package:area_and_plot/features/map_calculator/presentation/screens/map_calculator_screen.dart';
import 'package:area_and_plot/features/unit_converter/presentation/screens/unit_converter_screen.dart';
import 'package:area_and_plot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => _ScaffoldWithNavBar(shell: shell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/calculator',
              builder: (_, __) => const AreaCalculatorScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/map',
              builder: (_, __) => const MapCalculatorScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/converter',
              builder: (_, __) => const UnitConverterScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/history',
            builder: (_, __) => const HistoryScreen(),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (_, state) => HistoryDetailScreen(
                  entry: state.extra as HistoryEntry,
                ),
              ),
            ],
          ),
        ]),
      ],
    ),
  ],
);

class _ScaffoldWithNavBar extends StatelessWidget {
  const _ScaffoldWithNavBar({required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      drawer: const AppDrawer(),
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: shell.goBranch,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calculate_outlined),
            selectedIcon: const Icon(Icons.calculate),
            label: l.calculator,
          ),
          NavigationDestination(
            icon: const Icon(Icons.map_outlined),
            selectedIcon: const Icon(Icons.map),
            label: l.map,
          ),
          NavigationDestination(
            icon: const Icon(Icons.swap_horiz_outlined),
            selectedIcon: const Icon(Icons.swap_horiz),
            label: l.converter,
          ),
          NavigationDestination(
            icon: const Icon(Icons.history_outlined),
            selectedIcon: const Icon(Icons.history),
            label: l.history,
          ),
        ],
      ),
    );
  }
}
