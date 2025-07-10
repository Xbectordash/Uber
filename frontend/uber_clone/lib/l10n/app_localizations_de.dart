// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Rave Ride';

  @override
  String get welcomeMessage =>
      '🚗 Deine Fahrt, dein Stil! ✨\nWillkommen beim neuen Rave Ride Erlebnis! 🎉';

  @override
  String get continueText => 'Weiter';

  @override
  String get enterYour => 'Gib dein(e)';

  @override
  String get nameString => 'Name';

  @override
  String get firstName => 'Vorname';

  @override
  String get lastName => 'Nachname';

  @override
  String get emailString => 'E-Mail';

  @override
  String get phoneString => 'Telefonnummer';

  @override
  String get passwordString => 'Passwort';

  @override
  String get confirmPasswordString => 'Passwort bestätigen';

  @override
  String get createAccountString => 'Konto erstellen';

  @override
  String get signupMessage =>
      '👋 Hey, schöner Mensch – Erstelle dein Konto, bevor diese Fahrt jemand anderem gehört 😏🚗';

  @override
  String get accountCreationLogic => 'Logik zur Kontoerstellung hier!';

  @override
  String get loginString => 'Anmelden';

  @override
  String get loginMessage =>
      'Willkommen zurück! Bitte melde dich an, um fortzufahren.';

  @override
  String get loginLogic => 'Anmelde-Logik hier!';

  @override
  String get welcomePassenger => 'Willkommen, Fahrgast! Bitte melde dich an.';

  @override
  String get welcomeCaptain => 'Willkommen, Fahrer! Bitte melde dich an.';

  @override
  String get updateInfo => 'Informationen aktualisieren';

  @override
  String get update => 'Aktualisieren';

  @override
  String get updateProfile => 'Profil aktualisieren';

  @override
  String get updateProfileMessage =>
      'Aktualisiere deine Profilinformationen unten.';

  @override
  String get userInfoUpdated => 'Benutzerinformationen wurden aktualisiert!';

  @override
  String get profileUpdated => 'Profil wurde aktualisiert!';

  @override
  String get logout => 'Abmelden';

  @override
  String get firstNameRequired => 'Vorname ist erforderlich';

  @override
  String get firstNameMin => 'Vorname muss mindestens 2 Zeichen haben';

  @override
  String get lastNameRequired => 'Nachname ist erforderlich';

  @override
  String get lastNameMin => 'Nachname muss mindestens 2 Zeichen haben';

  @override
  String get emailRequired => 'E-Mail ist erforderlich';

  @override
  String get emailInvalid => 'Bitte gib eine gültige E-Mail-Adresse ein';

  @override
  String get passwordRequired => 'Passwort ist erforderlich';

  @override
  String get passwordMin => 'Passwort muss mindestens 6 Zeichen haben';

  @override
  String get confirmPasswordRequired => 'Bitte bestätige dein Passwort';

  @override
  String get passwordsDoNotMatch => 'Passwörter stimmen nicht überein';

  @override
  String get vehicleCapacityInvalid => 'Ungültige Fahrzeugkapazität';

  @override
  String get homeRouteName => 'startseite';

  @override
  String get userHomeRouteName => 'benutzer-start';

  @override
  String get captainHomeRouteName => 'fahrer-start';

  @override
  String get loginRouteName => 'login-seite';

  @override
  String get signupRouteName => 'registrierungs-seite';

  @override
  String get updateUserRouteName => 'benutzer-aktualisieren';

  @override
  String get captainSignupRouteName => 'fahrer-registrierung';

  @override
  String get landingRouteName => 'startbildschirm';

  @override
  String get appStartRouteName => 'app-startbildschirm';

  @override
  String get dontHaveAccount => 'Noch kein Konto? ';

  @override
  String get captainSignupMessage =>
      'Registriere dich als Fahrer und füge deine Fahrzeugdaten hinzu, um loszulegen!';

  @override
  String get vehicleDetails => 'Fahrzeugdetails';

  @override
  String get vehicleColor => 'Farbe';

  @override
  String get vehicleColorRequired => 'Farbe ist erforderlich';

  @override
  String get vehiclePlate => 'Kennzeichen';

  @override
  String get vehiclePlateRequired => 'Kennzeichen ist erforderlich';

  @override
  String get vehicleCapacity => 'Kapazität';

  @override
  String get vehicleCapacityRequired => 'Kapazität ist erforderlich';

  @override
  String get vehicleType => 'Fahrzeugtyp';

  @override
  String get vehicleTypeRequired => 'Fahrzeugtyp ist erforderlich';

  @override
  String get captainSignupLogic => 'Logik zur Fahrerregistrierung hier!';

  @override
  String get createCaptainAccountString => 'Fahrerkonto erstellen';

  @override
  String get carSubtitle => 'Günstiges Auto für tägliche Fahrten';

  @override
  String get taxiSubtitle => 'Klassisches Taxi für Stadttouren';

  @override
  String get motoSubtitle => 'Günstiges Motorrad für kurze Strecken';

  @override
  String get carType => 'Auto';

  @override
  String get autoType => 'Auto-Rikscha';

  @override
  String get motorcycleType => 'Motorrad';

  @override
  String get failedToEndRide => 'Fahrt konnte nicht beendet werden: ';

  @override
  String get unknownError => 'Unbekannter Fehler';

  @override
  String get enterOtpToStartRide => 'Gib den OTP ein, um die Fahrt zu starten';

  @override
  String get confirmOtpStartRide => 'OTP bestätigen und Fahrt starten';

  @override
  String get activeStatus => 'aktiv';

  @override
  String get colorLabel => 'Farbe: ';

  @override
  String get typeLabel => 'Typ: ';

  @override
  String get plateLabel => 'Kennzeichen: ';

  @override
  String get rideStarted => '🚕 Fahrt gestartet';

  @override
  String get sourceLabel => 'Start:';

  @override
  String get destinationLabel => 'Ziel:';

  @override
  String get fareLabel => 'Fahrpreis: ';

  @override
  String get rideCompleted => 'Fahrt abgeschlossen';

  @override
  String get driverLabel => 'Fahrer: ';

  @override
  String get vehicleNoLabel => 'Fahrzeugnummer: ';

  @override
  String get vehicleLabel => 'Fahrzeug: ';

  @override
  String get languageLabel => 'Language: ';

  @override
  String get selectLanguage => 'Sprache auswählen';

  @override
  String get otpLabel => 'OTP: ';

  @override
  String get makePayment => 'Bezahlen';

  @override
  String get waitingForDriver => 'Warte auf den Fahrer...';

  @override
  String get cancelRide => 'Fahrt abbrechen';

  @override
  String get startTypingHint => 'Beginne zu tippen, um Vorschläge zu sehen.';

  @override
  String get pickupHint => 'Abholort';

  @override
  String get destinationHint => 'Wohin möchtest du?';

  @override
  String get carName => 'Auto';

  @override
  String get autoName => 'Rikscha';

  @override
  String get motorcycleName => 'Motorrad';

  @override
  String get rideCreated => 'Fahrt erstellt!';

  @override
  String get rideIdLabel => 'Fahrt-ID: ';

  @override
  String get panelHandleTapped => 'Panelgriff wurde getippt';

  @override
  String get selectVehicle => 'Bitte wähle ein Fahrzeug aus';

  @override
  String get errorPrefix => 'Fehler: ';

  @override
  String get noSuggestions => 'Keine Vorschläge gefunden.';

  @override
  String get startTyping => 'Beginnen Sie zu tippen, um Vorschläge zu sehen.';
}
