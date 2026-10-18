import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/app_navigation_router.dart';
import 'package:oryon_mobile/app/router/app_shell.dart';
import 'package:oryon_mobile/core/logging/app_logger.dart';
import 'package:oryon_mobile/features/auth/module.dart';
import 'package:oryon_mobile/features/home/module.dart';
import 'package:oryon_mobile/features/onboarding/module.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

abstract final class AppRouter {
  static GoRouter initialize({
    required List<BaseModule> modules,
    required List<BaseModule> shellTabs,
  }) => GoRouter(
    initialLocation: HomeModule.rootPath,
    routes: [
      // The tab routes are mounted inside the shell branches. Registering them
      // top level as well would let go_router match those instead, and the tabs
      // would never open.
      StatefulShellRoute.indexedStack(
        builder: (_, _, navShell) => AppShell(navigationShell: navShell),
        // Each tab keeps its own navigation stack, so every shell tab becomes a
        // branch of the shell route.
        branches: [
          for (final tab in shellTabs) StatefulShellBranch(routes: tab.routes),
        ],
      ),

      //
      for (final module in modules)
        if (!shellTabs.contains(module)) ...module.routes,
    ],
    redirect: (_, state) {
      final atOnboard =
          state.matchedLocation == OnboardingModule.walkthroughPath;
      if (OnboardingModule.isFirstTime) {
        return atOnboard ? null : OnboardingModule.walkthroughPath;
      }

      final atAuth = AuthModule.isAuthPath(state.matchedLocation);
      if (AuthModule.isAuthenticated) {
        return atAuth ? HomeModule.rootPath : null;
      }

      return atAuth ? null : AuthModule.loginPath;
    },
    errorBuilder: (context, state) {
      AppLogger.error(
        'Router could not resolve a location',
        error: state.error,
        data: {'location': state.matchedLocation},
      );

      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/svgs/page_not_found.svg',
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                context.l10n.routeErrorTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                context.l10n.routeErrorMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.xxl),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: context.l10n.routeErrorBackHome,
                  onPressed: () => GoRouter.of(context).goToHome(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
