import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/theme/theme.dart';
import 'package:oryon_mobile/core/config/app_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
        actions: [
          BlocBuilder<L10nCubit, Locale>(
            builder: (context, locale) => TextButton(
              onPressed: context.read<L10nCubit>().toggle,
              child: Text(locale.languageCode),
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) => IconButton(
              onPressed: context.read<ThemeCubit>().toggle,
              icon: Icon(
                mode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          context.l10n.appTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
