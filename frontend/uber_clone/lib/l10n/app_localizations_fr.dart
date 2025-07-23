// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Rave Ride';

  @override
  String get welcomeMessage =>
      '🚗 Votre trajet, à votre façon ! ✨\nBienvenue dans la nouvelle expérience Rave Ride ! 🎉';

  @override
  String get continueText => 'Continuer';

  @override
  String get enterYour => 'Entrez votre';

  @override
  String get nameString => 'Nom';

  @override
  String get firstName => 'Prénom';

  @override
  String get lastName => 'Nom de famille';

  @override
  String get emailString => 'Email';

  @override
  String get phoneString => 'Téléphone';

  @override
  String get passwordString => 'Mot de passe';

  @override
  String get confirmPasswordString => 'Confirmez le mot de passe';

  @override
  String get createAccountString => 'Créer un compte';

  @override
  String get signupMessage =>
      '👋 Salut, beau gosse — crée ton compte avant que ce trajet ne soit pris 😏🚗';

  @override
  String get accountCreationLogic =>
      'La logique de création de compte va ici !';

  @override
  String get loginString => 'Connexion';

  @override
  String get loginMessage =>
      'Bon retour ! Veuillez vous connecter pour continuer.';

  @override
  String get loginLogic => 'Logique de connexion ici !';

  @override
  String get welcomePassenger =>
      'Bienvenue passager ! Veuillez vous connecter.';

  @override
  String get welcomeCaptain => 'Bienvenue chauffeur ! Veuillez vous connecter.';

  @override
  String get updateInfo => 'Mettre à jour les infos';

  @override
  String get update => 'Mettre à jour';

  @override
  String get updateProfile => 'Mettre à jour le profil';

  @override
  String get updateProfileMessage =>
      'Mettez à jour vos informations ci-dessous.';

  @override
  String get userInfoUpdated => 'Infos utilisateur mises à jour !';

  @override
  String get profileUpdated => 'Profil mis à jour !';

  @override
  String get logout => 'Déconnexion';

  @override
  String get firstNameRequired => 'Le prénom est requis';

  @override
  String get firstNameMin => 'Le prénom doit contenir au moins 2 caractères';

  @override
  String get lastNameRequired => 'Le nom est requis';

  @override
  String get lastNameMin => 'Le nom doit contenir au moins 2 caractères';

  @override
  String get emailRequired => 'L\'email est requis';

  @override
  String get emailInvalid => 'Veuillez entrer une adresse email valide';

  @override
  String get passwordRequired => 'Le mot de passe est requis';

  @override
  String get passwordMin =>
      'Le mot de passe doit contenir au moins 6 caractères';

  @override
  String get confirmPasswordRequired => 'Veuillez confirmer le mot de passe';

  @override
  String get passwordsDoNotMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get vehicleCapacityInvalid => 'Capacité du véhicule invalide';

  @override
  String get homeRouteName => 'écran-accueil';

  @override
  String get userHomeRouteName => 'utilisateur-accueil';

  @override
  String get captainHomeRouteName => 'chauffeur-accueil';

  @override
  String get loginRouteName => 'écran-connexion';

  @override
  String get signupRouteName => 'écran-inscription';

  @override
  String get updateUserRouteName => 'écran-mise-à-jour';

  @override
  String get captainSignupRouteName => 'inscription-chauffeur';

  @override
  String get landingRouteName => 'écran-accueil';

  @override
  String get appStartRouteName => 'écran-démarrage';

  @override
  String get dontHaveAccount => 'Pas encore de compte ? ';

  @override
  String get captainSignupMessage =>
      'Inscrivez-vous en tant que chauffeur et ajoutez les détails de votre véhicule pour commencer !';

  @override
  String get vehicleDetails => 'Détails du véhicule';

  @override
  String get vehicleColor => 'Couleur';

  @override
  String get vehicleColorRequired => 'La couleur est requise';

  @override
  String get vehiclePlate => 'Plaque';

  @override
  String get vehiclePlateRequired => 'La plaque est requise';

  @override
  String get vehicleCapacity => 'Capacité';

  @override
  String get vehicleCapacityRequired => 'La capacité est requise';

  @override
  String get vehicleType => 'Type de véhicule';

  @override
  String get vehicleTypeRequired => 'Le type de véhicule est requis';

  @override
  String get captainSignupLogic => 'Logique d\'inscription chauffeur ici !';

  @override
  String get createCaptainAccountString => 'Créer un compte chauffeur';

  @override
  String get carSubtitle => 'Voiture abordable pour les trajets quotidiens';

  @override
  String get taxiSubtitle => 'Taxi classique pour les trajets en ville';

  @override
  String get motoSubtitle => 'Moto économique pour les trajets rapides';

  @override
  String get carType => 'voiture';

  @override
  String get autoType => 'auto';

  @override
  String get motorcycleType => 'moto';

  @override
  String get failedToEndRide => 'Échec de fin de course : ';

  @override
  String get unknownError => 'Erreur inconnue';

  @override
  String get enterOtpToStartRide => 'Entrez l\'OTP pour démarrer la course';

  @override
  String get confirmOtpStartRide => 'Confirmer OTP et démarrer la course';

  @override
  String get activeStatus => 'actif';

  @override
  String get colorLabel => 'Couleur : ';

  @override
  String get typeLabel => 'Type : ';

  @override
  String get plateLabel => 'Plaque : ';

  @override
  String get rideStarted => '🚕 Course démarrée';

  @override
  String get sourceLabel => 'Départ :';

  @override
  String get destinationLabel => 'Destination :';

  @override
  String get fareLabel => 'Tarif : ';

  @override
  String get rideCompleted => 'Course terminée';

  @override
  String get driverLabel => 'Chauffeur : ';

  @override
  String get vehicleNoLabel => 'N° véhicule : ';

  @override
  String get vehicleLabel => 'Véhicule : ';

  @override
  String get languageLabel => 'Language: ';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get otpLabel => 'OTP : ';

  @override
  String get makePayment => 'Payer';

  @override
  String get waitingForDriver => 'En attente du chauffeur...';

  @override
  String get cancelRide => 'Annuler la course';

  @override
  String get startTypingHint => 'Commencez à taper pour voir les suggestions.';

  @override
  String get pickupHint => 'Lieu de prise en charge';

  @override
  String get destinationHint => 'Où aller ?';

  @override
  String get carName => 'Voiture';

  @override
  String get autoName => 'Auto';

  @override
  String get motorcycleName => 'Moto';

  @override
  String get rideCreated => 'Course créée !';

  @override
  String get rideIdLabel => 'ID de course : ';

  @override
  String get panelHandleTapped => 'Poignée du panneau touchée';

  @override
  String get selectVehicle => 'Veuillez sélectionner un véhicule';

  @override
  String get errorPrefix => 'Erreur : ';

  @override
  String get noSuggestions => 'Aucune suggestion trouvée.';

  @override
  String get startTyping => 'Commencez à taper pour voir les suggestions.';
}
