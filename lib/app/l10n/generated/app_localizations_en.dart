// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Oryon';

  @override
  String get made_by => 'Me';

  @override
  String get onboardingTitle1 => 'Stay connected';

  @override
  String get onboardingBody1 =>
      'Reach the people you work with, wherever they are.';

  @override
  String get onboardingTitle2 => 'Organize your day';

  @override
  String get onboardingBody2 =>
      'Tasks, notes and updates in one place, not five.';

  @override
  String get onboardingTitle3 => 'Pick up anywhere';

  @override
  String get onboardingBody3 =>
      'Every change syncs instantly across your devices.';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get navHome => 'Home';

  @override
  String get navExplore => 'Explore';

  @override
  String get navTeam => 'Team';

  @override
  String get navProfile => 'Profile';

  @override
  String get authSignIn => 'Sign in';

  @override
  String get authCreateAccount => 'Create account';

  @override
  String get authIdentifier => 'Email or username';

  @override
  String get authName => 'Full name';

  @override
  String get authEmail => 'Email';

  @override
  String get authPhone => 'Phone';

  @override
  String get authPassword => 'Password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authForgotPasswordTitle => 'Reset password';

  @override
  String get authSendResetCode => 'Send code';

  @override
  String get authResetSent =>
      'If that account exists, we have sent a reset code.';

  @override
  String get authVerifyTitle => 'Verify your account';

  @override
  String authVerifySubtitle(String identifier) {
    return 'Enter the code we sent to $identifier';
  }

  @override
  String get authCode => '6-digit code';

  @override
  String get authVerify => 'Verify';

  @override
  String get authNoAccount => 'Don\'t have an account?';

  @override
  String get authHaveAccount => 'Already have an account?';

  @override
  String get authRequired => 'This field is required';

  @override
  String get authErrorInvalidEmail => 'That email does not look right';

  @override
  String get authErrorInvalidPhone => 'Use the +62xxxxxxxxxx format';

  @override
  String get authErrorPasswordTooShort => 'Use at least 8 characters';

  @override
  String get authErrorGeneric => 'Something went wrong. Please try again.';

  @override
  String get authErrorInvalidCredentials => 'Wrong email or password.';

  @override
  String get authErrorTooManyAttempts =>
      'Too many attempts. Please try again later.';

  @override
  String get authErrorNetwork =>
      'No connection. Check your network and try again.';

  @override
  String get authMfaUnsupported => 'Multi-factor login is not supported yet.';

  @override
  String get fieldShowPassword => 'Show password';

  @override
  String get fieldHidePassword => 'Hide password';

  @override
  String get routeErrorTitle => 'Something went wrong';

  @override
  String get routeErrorMessage =>
      'This page is unavailable. Go back home and try again.';

  @override
  String get routeErrorBackHome => 'Back to Home';

  @override
  String get exitPressAgain => 'Press back again to exit';

  @override
  String get profileSignOut => 'Sign out';

  @override
  String get profileSignOutTitle => 'Sign out?';

  @override
  String get profileSignOutMessage => 'You\'ll be signed out of your account.';

  @override
  String get profileSignOutCancel => 'Cancel';

  @override
  String get profileLoadError => 'Couldn\'t load your profile.';
}
