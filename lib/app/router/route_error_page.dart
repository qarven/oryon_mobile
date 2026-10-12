import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/app_navigation_router.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

class RouteErrorPage extends StatelessWidget {
  @Preview(
    name: 'Route error page',
    size: Size(360, 780), // Galaxy S25 Android 14
    localizations: previewLocalizationsData,
  )
  const RouteErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              'Page Not Found',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Oops! The page you are looking for is not found',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.xxl),
            AppButton(
              label: 'Back to Home',
              isExpanded: true,
              onPressed: () => GoRouter.of(context).goToHome(),
            ),
          ],
        ),
      ),
    );
  }
}

PreviewLocalizationsData previewLocalizationsData() =>
    const PreviewLocalizationsData(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
    );
