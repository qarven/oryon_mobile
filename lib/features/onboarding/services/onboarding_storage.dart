import 'package:shared_preferences/shared_preferences.dart';

class OnboardingStorage {
  OnboardingStorage(this._prefs);

  final SharedPreferences _prefs;

  static const _key = 'hasCompletedOnboarding';

  // Sync: prefs are already in memory before the router is built, so the first
  // navigation can read this without a loading frame.
  bool hasCompleted() => _prefs.getBool(_key) ?? false;

  Future<void> write() => _prefs.setBool(_key, true);
}
