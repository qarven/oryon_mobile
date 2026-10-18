import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/app_router.dart';
import 'package:oryon_mobile/app/theme/theme.dart';
import 'package:oryon_mobile/core/logging/app_logger.dart';
import 'package:oryon_mobile/features/auth/module.dart';
import 'package:oryon_mobile/features/auth/services/auth_session.dart';
import 'package:oryon_mobile/features/explore/module.dart';
import 'package:oryon_mobile/features/home/module.dart';
import 'package:oryon_mobile/features/onboarding/module.dart';
import 'package:oryon_mobile/features/profile/module.dart';
import 'package:oryon_mobile/features/team/module.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Application entry point.
///
/// Startup is intentionally completed before [runApp] so that application
/// dependencies and authentication state are available when the first
/// Flutter frame is rendered.
Future<void> main() async {
  // Initialize Flutter before accessing plugins or platform services.
  WidgetsFlutterBinding.ensureInitialized();

  // Configure application-wide logging before startup operations begin.
  AppLogger.initialize();

  // Initialize persistent storage shared by application features.
  final ins = GetIt.I;
  final prefs = await SharedPreferences.getInstance();

  // Register and initialize feature modules.
  //
  // Each module is responsible for registering its own dependencies.
  // All modules must be initialized before services that depend on them,
  // such as the application router, are created.
  //
  // The bottom navigation tabs are listed separately because the router mounts
  // their routes as branches of the shell, in this order.
  final shellTabs = <BaseModule>[
    HomeModule(),
    ExploreModule(),
    TeamModule(),
    ProfileModule(),
  ];

  final modules = <BaseModule>[
    OnboardingModule(),
    AuthModule(),
    ...shellTabs,
  ];

  for (final module in modules) {
    module.initialize();
  }

  final router = AppRouter.initialize(modules: modules, shellTabs: shellTabs);

  // Restore the previously stored authentication session before launching
  // the application, allowing the router to determine the initial route
  // using the restored authentication state.
  //
  // If restoration fails, log the error and continue startup. A failed
  // restoration should not prevent the application from opening.
  try {
    await ins<AuthSession>().restore();
  } on Object catch (error, stackTrace) {
    // A session that cannot be read means signed out, not a crash on launch.
    AppLogger.error(
      'Startup could not restore the stored session',
      error: error,
      stackTrace: stackTrace,
    );
  }

  ins
    // Register application-wide singleton services.
    ..registerSingleton<SharedPreferences>(prefs)
    ..registerSingleton<L10nStorage>(L10nStorage(prefs))
    ..registerSingleton<ThemeStorage>(ThemeStorage(prefs))
    ..registerSingleton<GoRouter>(router)
    // Register application-wide factory services.
    ..registerFactory<ThemeCubit>(() => ThemeCubit(ins<ThemeStorage>()))
    ..registerFactory<L10nCubit>(() => L10nCubit(ins<L10nStorage>()));

  // Launch the application after startup initialization is complete.
  runApp(const OryonApp());
}
