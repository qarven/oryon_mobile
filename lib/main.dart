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
import 'package:oryon_mobile/features/home/module.dart';
import 'package:oryon_mobile/features/onboarding/module.dart';
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
  final prefs = await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton<SharedPreferences>(prefs);

  // Register and initialize feature modules.
  //
  // Each module is responsible for registering its own dependencies.
  // All modules must be initialized before services that depend on them,
  // such as the application router, are created.
  final modules = <BaseModule>[
    OnboardingModule(),
    AuthModule(),
    HomeModule(),
  ];

  for (final module in modules) {
    module.initialize();
  }

  // Restore the previously stored authentication session before launching
  // the application, allowing the router to determine the initial route
  // using the restored authentication state.
  //
  // If restoration fails, log the error and continue startup. A failed
  // restoration should not prevent the application from opening.
  try {
    await GetIt.instance<AuthSession>().restore();
  } on Object catch (error, stackTrace) {
    // A session that cannot be read means signed out, not a crash on launch.
    AppLogger.error(
      'Startup could not restore the stored session',
      error: error,
      stackTrace: stackTrace,
    );
  }

  // Register application-wide singleton services.
  GetIt.instance.registerSingleton<L10nStorage>(L10nStorage(prefs));
  GetIt.instance.registerSingleton<ThemeStorage>(ThemeStorage(prefs));
  GetIt.instance.registerSingleton<GoRouter>(AppRouter.initialize(modules));
  // Register application-wide factory services.
  GetIt.instance.registerFactory<ThemeCubit>(
    () => ThemeCubit(GetIt.instance<ThemeStorage>()),
  );
  GetIt.instance.registerFactory<L10nCubit>(
    () => L10nCubit(GetIt.instance<L10nStorage>()),
  );

  // Launch the application after startup initialization is complete.
  runApp(const OryonApp());
}
