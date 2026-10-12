import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/features/home/home_page.dart';
import 'package:oryon_mobile/features/home/home_shell.dart';
import 'package:oryon_mobile/features/home/placeholder_page.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';

final class HomeModule implements BaseModule {
  static const rootPath = '/';
  static const rootName = 'home';
  static const featureAPath = '/feature-a';
  static const featureAName = 'feature-a';
  static const featureBPath = '/feature-b';
  static const featureBName = 'feature-b';
  static const accountPath = '/account';
  static const accountName = 'account';

  // Indexed by the NavigationBar, so the order has to match HomeShell.
  static const tabs = [rootPath, featureAPath, featureBPath, accountPath];

  // A nested subroute keeps the tab it lives under instead of snapping the user
  // back to the first one.
  static int indexOfTab(String location) {
    final index = tabs.lastIndexWhere(
      (tab) => location == tab || location.startsWith('$tab/'),
    );
    return index < 0 ? 0 : index;
  }

  // Nothing to register: the home pages are stateless and read nothing shared.
  @override
  void initialize() {}

  @override
  List<RouteBase> get routes => [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => HomeShell(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: rootName,
              path: rootPath,
              builder: (_, _) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: featureAName,
              path: featureAPath,
              builder: (context, _) => PlaceholderPage(
                title: context.l10n.navFeatureA,
                icon: Icons.widgets_outlined,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: featureBName,
              path: featureBPath,
              builder: (context, _) => PlaceholderPage(
                title: context.l10n.navFeatureB,
                icon: Icons.dashboard_outlined,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: accountName,
              path: accountPath,
              builder: (context, _) => PlaceholderPage(
                title: context.l10n.navAccount,
                icon: Icons.person_outline,
              ),
            ),
          ],
        ),
      ],
    ),
  ];
}
