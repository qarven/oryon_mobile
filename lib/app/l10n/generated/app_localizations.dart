import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// Application name shown in the app bar and launcher
  ///
  /// In en, this message translates to:
  /// **'Oryon'**
  String get appTitle;

  /// who create the app
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get made_by;

  /// First onboarding slide title
  ///
  /// In en, this message translates to:
  /// **'Stay connected'**
  String get onboardingTitle1;

  /// First onboarding slide body
  ///
  /// In en, this message translates to:
  /// **'Reach the people you work with, wherever they are.'**
  String get onboardingBody1;

  /// Second onboarding slide title
  ///
  /// In en, this message translates to:
  /// **'Organize your day'**
  String get onboardingTitle2;

  /// Second onboarding slide body
  ///
  /// In en, this message translates to:
  /// **'Tasks, notes and updates in one place, not five.'**
  String get onboardingBody2;

  /// Third onboarding slide title
  ///
  /// In en, this message translates to:
  /// **'Pick up anywhere'**
  String get onboardingTitle3;

  /// Third onboarding slide body
  ///
  /// In en, this message translates to:
  /// **'Every change syncs instantly across your devices.'**
  String get onboardingBody3;

  /// Advances to the next walkthrough slide
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// Finishes the walkthrough
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// Bottom navigation label of the home tab
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Bottom navigation label of the first placeholder feature
  ///
  /// In en, this message translates to:
  /// **'Feature A'**
  String get navFeatureA;

  /// Bottom navigation label of the second placeholder feature
  ///
  /// In en, this message translates to:
  /// **'Feature B'**
  String get navFeatureB;

  /// Bottom navigation label of the account tab
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get navAccount;

  /// Title and submit button of the login screen
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authSignIn;

  /// Title and submit button of the register screen
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get authCreateAccount;

  /// Label of the login identifier field
  ///
  /// In en, this message translates to:
  /// **'Email or username'**
  String get authIdentifier;

  /// Label of the register name field
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get authName;

  /// Label of the email identifier
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmail;

  /// Label of the phone identifier
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get authPhone;

  /// Label of the password field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// Link from the login screen to the reset screen
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// Title of the forgot password screen
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get authForgotPasswordTitle;

  /// Submit button of the forgot password screen
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get authSendResetCode;

  /// Confirmation shown after a reset code was requested
  ///
  /// In en, this message translates to:
  /// **'If that account exists, we have sent a reset code.'**
  String get authResetSent;

  /// Title of the registration verification screen
  ///
  /// In en, this message translates to:
  /// **'Verify your account'**
  String get authVerifyTitle;

  /// Explains where the verification code was sent
  ///
  /// In en, this message translates to:
  /// **'Enter the code we sent to {identifier}'**
  String authVerifySubtitle(String identifier);

  /// Label of the verification code field
  ///
  /// In en, this message translates to:
  /// **'6-digit code'**
  String get authCode;

  /// Submit button of the verification screen
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get authVerify;

  /// Prompt above the register link on the login screen
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get authNoAccount;

  /// Prompt above the sign in link on the register screen
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get authHaveAccount;

  /// Validation message for an empty field
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get authRequired;

  /// Validation message for a malformed email
  ///
  /// In en, this message translates to:
  /// **'That email does not look right'**
  String get authErrorInvalidEmail;

  /// Validation message for a phone number that is not E.164
  ///
  /// In en, this message translates to:
  /// **'Use the +62xxxxxxxxxx format'**
  String get authErrorInvalidPhone;

  /// Validation message for a password under the minimum length
  ///
  /// In en, this message translates to:
  /// **'Use at least 8 characters'**
  String get authErrorPasswordTooShort;

  /// Fallback message for an unexpected auth failure
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get authErrorGeneric;

  /// Message for rejected login credentials
  ///
  /// In en, this message translates to:
  /// **'Wrong email or password.'**
  String get authErrorInvalidCredentials;

  /// Message for a rate limited or locked out request
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please try again later.'**
  String get authErrorTooManyAttempts;

  /// Message when the API is unreachable
  ///
  /// In en, this message translates to:
  /// **'No connection. Check your network and try again.'**
  String get authErrorNetwork;

  /// Message when the account requires MFA, which has no screen yet
  ///
  /// In en, this message translates to:
  /// **'Multi-factor login is not supported yet.'**
  String get authMfaUnsupported;

  /// Tooltip of the toggle that reveals a password field
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get fieldShowPassword;

  /// Tooltip of the toggle that obscures a password field
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get fieldHidePassword;

  /// Title of the page shown when a route cannot be resolved
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get routeErrorTitle;

  /// Body of the page shown when a route cannot be resolved
  ///
  /// In en, this message translates to:
  /// **'This page is unavailable. Go back home and try again.'**
  String get routeErrorMessage;

  /// Label of the button that returns to the home route
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get routeErrorBackHome;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
