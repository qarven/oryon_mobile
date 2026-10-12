import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oryon_mobile/core/config/app_config.dart';

void main() {
  group('Flavor.fromName', () {
    test('maps production to Flavor.production', () {
      expect(Flavor.fromName('production'), Flavor.production);
    });

    test('maps staging to Flavor.staging', () {
      expect(Flavor.fromName('staging'), Flavor.staging);
    });

    test('falls back to staging for a missing or unknown name', () {
      expect(Flavor.fromName(null), Flavor.staging);
      expect(Flavor.fromName(''), Flavor.staging);
      expect(Flavor.fromName('nonsense'), Flavor.staging);
    });
  });

  group('AppConfig', () {
    // The expectations follow FLUTTER_APP_FLAVOR because AppConfig resolves
    // once from the flavor the app was compiled with, and `make test` runs
    // without --flavor, so it is staging.
    test('resolves the flavor the app was built with', () {
      switch (Flavor.fromName(appFlavor)) {
        case Flavor.production:
          expect(AppConfig.isProd, isTrue);
          expect(AppConfig.isStg, isFalse);
          expect(AppConfig.appName, 'Oryon');
          expect(AppConfig.packageName, 'dev.qarven.oryon');
        case Flavor.staging:
          expect(AppConfig.isStg, isTrue);
          expect(AppConfig.isProd, isFalse);
          expect(AppConfig.appName, 'Oryon Staging');
          expect(AppConfig.packageName, 'dev.qarven.oryon.stg');
      }
    });
  });
}
