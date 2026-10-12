import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/router/route_error_page.dart';
import 'package:oryon_mobile/core/logging/app_logger.dart';
import 'package:oryon_mobile/features/auth/module.dart';
import 'package:oryon_mobile/features/home/module.dart';
import 'package:oryon_mobile/features/onboarding/module.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';

abstract final class AppRouter {
  static GoRouter initialize(List<BaseModule> modules) => GoRouter(
    initialLocation: HomeModule.rootPath,
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
    routes: [for (final module in modules) ...module.routes],
    errorBuilder: (context, state) {
      AppLogger.error(
        'Router could not resolve a location',
        error: state.error,
        data: {'location': state.matchedLocation},
      );

      return const RouteErrorPage();
    },
  );
}
