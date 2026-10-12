import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum Flavor {
  staging,
  production;

  static Flavor fromName(String? name) =>
      name == 'production' ? production : staging;
}

abstract final class AppConfig {
  static final Flavor _flavor = Flavor.fromName(appFlavor);

  static String get appName => switch (_flavor) {
    Flavor.staging => 'Oryon Staging',
    Flavor.production => 'Oryon',
  };

  static String get packageName => switch (_flavor) {
    Flavor.staging => 'dev.qarven.oryon.stg',
    Flavor.production => 'dev.qarven.oryon',
  };

  static String get apiBaseUrl => switch (_flavor) {
    Flavor.staging => 'https://oryon-staging.qarven.dev',
    Flavor.production => 'https://oryon.qarven.dev',
  };

  static bool get isStg => _flavor == Flavor.staging;
  static bool get isProd => _flavor == Flavor.production;
  static bool get isDebugMode => kDebugMode;
}
