import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/theme/theme.dart';
import 'package:oryon_mobile/core/config/app_config.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class OryonApp extends StatelessWidget {
  const OryonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (ctx) => GetIt.instance<ThemeCubit>()),
        BlocProvider<L10nCubit>(create: (ctx) => GetIt.instance<L10nCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (ctx, themeMode) {
          return BlocBuilder<L10nCubit, Locale>(
            builder: (ctx, locale) {
              return MaterialApp.router(
                title: AppConfig.appName,
                scaffoldMessengerKey: rootScaffoldMessengerKey,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                locale: locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: GetIt.instance<GoRouter>(),
              );
            },
          );
        },
      ),
    );
  }
}
