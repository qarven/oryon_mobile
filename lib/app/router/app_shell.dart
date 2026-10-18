import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/back_to_exit_guard.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BackToExitGuard(
      child: Theme(
        // YouTube tabs just switch icon and label colour, with no ink ripple
        // and no shadow, so they must not feel like buttons.
        data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        child: Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: context.colorScheme.surface,
              indicatorColor: Colors.transparent,
              elevation: 0,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              iconTheme: WidgetStateProperty.resolveWith(
                (states) => IconThemeData(
                  color: states.contains(WidgetState.selected)
                      ? context.colorScheme.onSurface
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            child: NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) => navigationShell.goBranch(
                index,
                // Tapping the active tab pops it back to its root, like every
                // other mobile app does.
                initialLocation: index == navigationShell.currentIndex,
              ),
              // Indexed by the NavigationBar, so the order has to match the
              // shell tab modules registered in main.dart.
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.home_outlined),
                  selectedIcon: const Icon(Icons.home),
                  tooltip: context.l10n.navHome,
                  label: context.l10n.navHome,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.explore_outlined),
                  selectedIcon: const Icon(Icons.explore),
                  tooltip: context.l10n.navExplore,
                  label: context.l10n.navExplore,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.groups_outlined),
                  selectedIcon: const Icon(Icons.groups),
                  tooltip: context.l10n.navTeam,
                  label: context.l10n.navTeam,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.person_outline),
                  selectedIcon: const Icon(Icons.person),
                  tooltip: context.l10n.navProfile,
                  label: context.l10n.navProfile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
