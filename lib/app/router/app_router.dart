import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/app_navigation_router.dart';
import 'package:oryon_mobile/core/logging/app_logger.dart';
import 'package:oryon_mobile/features/auth/module.dart';
import 'package:oryon_mobile/features/home/module.dart';
import 'package:oryon_mobile/features/onboarding/module.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

abstract final class AppRouter {
  static GoRouter initialize(List<BaseModule> modules) => GoRouter(
    initialLocation: HomeModule.rootPath,
    routes: [for (final module in modules) ...module.routes],
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
              AppButton(
                label: context.l10n.routeErrorBackHome,
                isExpanded: true,
                onPressed: () => GoRouter.of(context).goToHome(),
              ),
            ],
          ),
        ),
      );
    },
  );
}
