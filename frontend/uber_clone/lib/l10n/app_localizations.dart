import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('gu'),
    Locale('hi'),
    Locale('ja'),
    Locale('ko'),
    Locale('mr'),
    Locale('ur'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Rave Ride'**
  String get appName;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'🚗 Your ride, your way! ✨\nWelcome to the new Rave Ride experience! 🎉'**
  String get welcomeMessage;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @enterYour.
  ///
  /// In en, this message translates to:
  /// **'Enter your'**
  String get enterYour;

  /// No description provided for @nameString.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameString;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @emailString.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailString;

  /// No description provided for @phoneString.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneString;

  /// No description provided for @passwordString.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordString;

  /// No description provided for @confirmPasswordString.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordString;

  /// No description provided for @createAccountString.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountString;

  /// No description provided for @signupMessage.
  ///
  /// In en, this message translates to:
  /// **'👋 Hey there, good lookin’ — create your account before this ride finds someone hotter 😏🚗'**
  String get signupMessage;

  /// No description provided for @accountCreationLogic.
  ///
  /// In en, this message translates to:
  /// **'Account creation logic goes here!'**
  String get accountCreationLogic;

  /// No description provided for @loginString.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginString;

  /// No description provided for @loginMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Please login to continue.'**
  String get loginMessage;

  /// No description provided for @loginLogic.
  ///
  /// In en, this message translates to:
  /// **'Login logic goes here!'**
  String get loginLogic;

  /// No description provided for @welcomePassenger.
  ///
  /// In en, this message translates to:
  /// **'Welcome Passenger! Please login to continue.'**
  String get welcomePassenger;

  /// No description provided for @welcomeCaptain.
  ///
  /// In en, this message translates to:
  /// **'Welcome Captain! Please login to continue.'**
  String get welcomeCaptain;

  /// No description provided for @updateInfo.
  ///
  /// In en, this message translates to:
  /// **'Update Info'**
  String get updateInfo;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @updateProfile.
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get updateProfile;

  /// No description provided for @updateProfileMessage.
  ///
  /// In en, this message translates to:
  /// **'Update your profile information below.'**
  String get updateProfileMessage;

  /// No description provided for @userInfoUpdated.
  ///
  /// In en, this message translates to:
  /// **'User info updated!'**
  String get userInfoUpdated;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated!'**
  String get profileUpdated;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @firstNameRequired.
  ///
  /// In en, this message translates to:
  /// **'First name is required'**
  String get firstNameRequired;

  /// No description provided for @firstNameMin.
  ///
  /// In en, this message translates to:
  /// **'First name must be at least 2 characters'**
  String get firstNameMin;

  /// No description provided for @lastNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Last name is required'**
  String get lastNameRequired;

  /// No description provided for @lastNameMin.
  ///
  /// In en, this message translates to:
  /// **'Last name must be at least 2 characters'**
  String get lastNameMin;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get emailInvalid;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMin.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMin;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @vehicleCapacityInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid vehicle capacity'**
  String get vehicleCapacityInvalid;

  /// No description provided for @homeRouteName.
  ///
  /// In en, this message translates to:
  /// **'home-screen'**
  String get homeRouteName;

  /// No description provided for @userHomeRouteName.
  ///
  /// In en, this message translates to:
  /// **'user-home'**
  String get userHomeRouteName;

  /// No description provided for @captainHomeRouteName.
  ///
  /// In en, this message translates to:
  /// **'captain-home'**
  String get captainHomeRouteName;

  /// No description provided for @loginRouteName.
  ///
  /// In en, this message translates to:
  /// **'login-screen'**
  String get loginRouteName;

  /// No description provided for @signupRouteName.
  ///
  /// In en, this message translates to:
  /// **'signup-screen'**
  String get signupRouteName;

  /// No description provided for @updateUserRouteName.
  ///
  /// In en, this message translates to:
  /// **'update-user-screen'**
  String get updateUserRouteName;

  /// No description provided for @captainSignupRouteName.
  ///
  /// In en, this message translates to:
  /// **'captain-signup'**
  String get captainSignupRouteName;

  /// No description provided for @landingRouteName.
  ///
  /// In en, this message translates to:
  /// **'landing-screen'**
  String get landingRouteName;

  /// No description provided for @appStartRouteName.
  ///
  /// In en, this message translates to:
  /// **'app-start-screen'**
  String get appStartRouteName;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @captainSignupMessage.
  ///
  /// In en, this message translates to:
  /// **'Register as a Captain and add your vehicle details to get started!'**
  String get captainSignupMessage;

  /// No description provided for @vehicleDetails.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Details'**
  String get vehicleDetails;

  /// No description provided for @vehicleColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get vehicleColor;

  /// No description provided for @vehicleColorRequired.
  ///
  /// In en, this message translates to:
  /// **'Color required'**
  String get vehicleColorRequired;

  /// No description provided for @vehiclePlate.
  ///
  /// In en, this message translates to:
  /// **'Plate'**
  String get vehiclePlate;

  /// No description provided for @vehiclePlateRequired.
  ///
  /// In en, this message translates to:
  /// **'Plate required'**
  String get vehiclePlateRequired;

  /// No description provided for @vehicleCapacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get vehicleCapacity;

  /// No description provided for @vehicleCapacityRequired.
  ///
  /// In en, this message translates to:
  /// **'Capacity required'**
  String get vehicleCapacityRequired;

  /// No description provided for @vehicleType.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Type'**
  String get vehicleType;

  /// No description provided for @vehicleTypeRequired.
  ///
  /// In en, this message translates to:
  /// **'Vehicle type required'**
  String get vehicleTypeRequired;

  /// No description provided for @captainSignupLogic.
  ///
  /// In en, this message translates to:
  /// **'Captain signup logic goes here!'**
  String get captainSignupLogic;

  /// No description provided for @createCaptainAccountString.
  ///
  /// In en, this message translates to:
  /// **'Create Captain Account'**
  String get createCaptainAccountString;

  /// No description provided for @carSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Affordable car for daily rides'**
  String get carSubtitle;

  /// No description provided for @taxiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Classic taxi for city travel'**
  String get taxiSubtitle;

  /// No description provided for @motoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Affordable moto for quick trips'**
  String get motoSubtitle;

  /// No description provided for @carType.
  ///
  /// In en, this message translates to:
  /// **'car'**
  String get carType;

  /// No description provided for @autoType.
  ///
  /// In en, this message translates to:
  /// **'auto'**
  String get autoType;

  /// No description provided for @motorcycleType.
  ///
  /// In en, this message translates to:
  /// **'motorcycle'**
  String get motorcycleType;

  /// No description provided for @failedToEndRide.
  ///
  /// In en, this message translates to:
  /// **'Failed to end ride: '**
  String get failedToEndRide;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @enterOtpToStartRide.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP to Start Ride'**
  String get enterOtpToStartRide;

  /// No description provided for @confirmOtpStartRide.
  ///
  /// In en, this message translates to:
  /// **'Confirm OTP & Start Ride'**
  String get confirmOtpStartRide;

  /// No description provided for @activeStatus.
  ///
  /// In en, this message translates to:
  /// **'active'**
  String get activeStatus;

  /// No description provided for @colorLabel.
  ///
  /// In en, this message translates to:
  /// **'Color: '**
  String get colorLabel;

  /// No description provided for @typeLabel.
  ///
  /// In en, this message translates to:
  /// **'Type: '**
  String get typeLabel;

  /// No description provided for @plateLabel.
  ///
  /// In en, this message translates to:
  /// **'Plate: '**
  String get plateLabel;

  /// No description provided for @rideStarted.
  ///
  /// In en, this message translates to:
  /// **'🚕 Ride Started'**
  String get rideStarted;

  /// No description provided for @sourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Source:'**
  String get sourceLabel;

  /// No description provided for @destinationLabel.
  ///
  /// In en, this message translates to:
  /// **'Destination:'**
  String get destinationLabel;

  /// No description provided for @fareLabel.
  ///
  /// In en, this message translates to:
  /// **'Fare: '**
  String get fareLabel;

  /// No description provided for @rideCompleted.
  ///
  /// In en, this message translates to:
  /// **'Ride Completed'**
  String get rideCompleted;

  /// No description provided for @driverLabel.
  ///
  /// In en, this message translates to:
  /// **'Driver: '**
  String get driverLabel;

  /// No description provided for @vehicleNoLabel.
  ///
  /// In en, this message translates to:
  /// **'Vehicle No: '**
  String get vehicleNoLabel;

  /// No description provided for @vehicleLabel.
  ///
  /// In en, this message translates to:
  /// **'Vehicle: '**
  String get vehicleLabel;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language: '**
  String get languageLabel;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @otpLabel.
  ///
  /// In en, this message translates to:
  /// **'OTP: '**
  String get otpLabel;

  /// No description provided for @makePayment.
  ///
  /// In en, this message translates to:
  /// **'Make Payment'**
  String get makePayment;

  /// No description provided for @waitingForDriver.
  ///
  /// In en, this message translates to:
  /// **'Waiting for Driver...'**
  String get waitingForDriver;

  /// No description provided for @cancelRide.
  ///
  /// In en, this message translates to:
  /// **'Cancel Ride'**
  String get cancelRide;

  /// No description provided for @startTypingHint.
  ///
  /// In en, this message translates to:
  /// **'Start typing to see suggestions.'**
  String get startTypingHint;

  /// No description provided for @pickupHint.
  ///
  /// In en, this message translates to:
  /// **'Pickup location'**
  String get pickupHint;

  /// No description provided for @destinationHint.
  ///
  /// In en, this message translates to:
  /// **'Where to?'**
  String get destinationHint;

  /// No description provided for @carName.
  ///
  /// In en, this message translates to:
  /// **'Car'**
  String get carName;

  /// No description provided for @autoName.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get autoName;

  /// No description provided for @motorcycleName.
  ///
  /// In en, this message translates to:
  /// **'Motorcycle'**
  String get motorcycleName;

  /// No description provided for @rideCreated.
  ///
  /// In en, this message translates to:
  /// **'Ride Created!'**
  String get rideCreated;

  /// No description provided for @rideIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Ride ID: '**
  String get rideIdLabel;

  /// No description provided for @panelHandleTapped.
  ///
  /// In en, this message translates to:
  /// **'Panel handle tapped'**
  String get panelHandleTapped;

  /// No description provided for @selectVehicle.
  ///
  /// In en, this message translates to:
  /// **'Please select a vehicle'**
  String get selectVehicle;

  /// No description provided for @errorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error: '**
  String get errorPrefix;

  /// No description provided for @noSuggestions.
  ///
  /// In en, this message translates to:
  /// **'No suggestions found.'**
  String get noSuggestions;

  /// No description provided for @startTyping.
  ///
  /// In en, this message translates to:
  /// **'Start typing to see suggestions.'**
  String get startTyping;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fa',
    'fr',
    'gu',
    'hi',
    'ja',
    'ko',
    'mr',
    'ur',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'mr':
      return AppLocalizationsMr();
    case 'ur':
      return AppLocalizationsUr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
