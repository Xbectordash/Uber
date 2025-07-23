// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Rave Ride';

  @override
  String get welcomeMessage =>
      '🚗 ¡Tu viaje, a tu manera! ✨\n¡Bienvenido a la nueva experiencia de Rave Ride! 🎉';

  @override
  String get continueText => 'Continuar';

  @override
  String get enterYour => 'Ingresa tu';

  @override
  String get nameString => 'Nombre';

  @override
  String get firstName => 'Nombre';

  @override
  String get lastName => 'Apellido';

  @override
  String get emailString => 'Correo electrónico';

  @override
  String get phoneString => 'Teléfono';

  @override
  String get passwordString => 'Contraseña';

  @override
  String get confirmPasswordString => 'Confirmar contraseña';

  @override
  String get createAccountString => 'Crear cuenta';

  @override
  String get signupMessage =>
      '👋 Hola guapo/a — ¡crea tu cuenta antes de que otro tome este viaje! 😏🚗';

  @override
  String get accountCreationLogic => '¡Lógica de creación de cuenta aquí!';

  @override
  String get loginString => 'Iniciar sesión';

  @override
  String get loginMessage =>
      '¡Bienvenido de nuevo! Inicia sesión para continuar.';

  @override
  String get loginLogic => '¡Lógica de inicio de sesión aquí!';

  @override
  String get welcomePassenger =>
      '¡Bienvenido pasajero! Inicia sesión para continuar.';

  @override
  String get welcomeCaptain =>
      '¡Bienvenido conductor! Inicia sesión para continuar.';

  @override
  String get updateInfo => 'Actualizar información';

  @override
  String get update => 'Actualizar';

  @override
  String get updateProfile => 'Actualizar perfil';

  @override
  String get updateProfileMessage => 'Actualiza tu información personal abajo.';

  @override
  String get userInfoUpdated => '¡Información del usuario actualizada!';

  @override
  String get profileUpdated => '¡Perfil actualizado!';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get firstNameRequired => 'El nombre es obligatorio';

  @override
  String get firstNameMin => 'El nombre debe tener al menos 2 caracteres';

  @override
  String get lastNameRequired => 'El apellido es obligatorio';

  @override
  String get lastNameMin => 'El apellido debe tener al menos 2 caracteres';

  @override
  String get emailRequired => 'El correo electrónico es obligatorio';

  @override
  String get emailInvalid => 'Ingresa un correo electrónico válido';

  @override
  String get passwordRequired => 'La contraseña es obligatoria';

  @override
  String get passwordMin => 'La contraseña debe tener al menos 6 caracteres';

  @override
  String get confirmPasswordRequired => 'Confirma tu contraseña';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas no coinciden';

  @override
  String get vehicleCapacityInvalid => 'Capacidad del vehículo no válida';

  @override
  String get homeRouteName => 'pantalla-inicio';

  @override
  String get userHomeRouteName => 'inicio-usuario';

  @override
  String get captainHomeRouteName => 'inicio-conductor';

  @override
  String get loginRouteName => 'pantalla-inicio-sesion';

  @override
  String get signupRouteName => 'pantalla-registro';

  @override
  String get updateUserRouteName => 'pantalla-actualizar-usuario';

  @override
  String get captainSignupRouteName => 'registro-conductor';

  @override
  String get landingRouteName => 'pantalla-principal';

  @override
  String get appStartRouteName => 'pantalla-inicial';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta? ';

  @override
  String get captainSignupMessage =>
      '¡Regístrate como conductor y agrega los detalles de tu vehículo para comenzar!';

  @override
  String get vehicleDetails => 'Detalles del vehículo';

  @override
  String get vehicleColor => 'Color';

  @override
  String get vehicleColorRequired => 'El color es obligatorio';

  @override
  String get vehiclePlate => 'Matrícula';

  @override
  String get vehiclePlateRequired => 'La matrícula es obligatoria';

  @override
  String get vehicleCapacity => 'Capacidad';

  @override
  String get vehicleCapacityRequired => 'La capacidad es obligatoria';

  @override
  String get vehicleType => 'Tipo de vehículo';

  @override
  String get vehicleTypeRequired => 'El tipo de vehículo es obligatorio';

  @override
  String get captainSignupLogic => '¡Lógica de registro del conductor aquí!';

  @override
  String get createCaptainAccountString => 'Crear cuenta de conductor';

  @override
  String get carSubtitle => 'Coche económico para viajes diarios';

  @override
  String get taxiSubtitle => 'Taxi clásico para viajar por la ciudad';

  @override
  String get motoSubtitle => 'Moto económica para trayectos rápidos';

  @override
  String get carType => 'coche';

  @override
  String get autoType => 'auto';

  @override
  String get motorcycleType => 'motocicleta';

  @override
  String get failedToEndRide => 'Error al finalizar el viaje: ';

  @override
  String get unknownError => 'Error desconocido';

  @override
  String get enterOtpToStartRide => 'Ingresa el OTP para iniciar el viaje';

  @override
  String get confirmOtpStartRide => 'Confirmar OTP e iniciar viaje';

  @override
  String get activeStatus => 'activo';

  @override
  String get colorLabel => 'Color: ';

  @override
  String get typeLabel => 'Tipo: ';

  @override
  String get plateLabel => 'Matrícula: ';

  @override
  String get rideStarted => ' Viaje iniciado';

  @override
  String get sourceLabel => 'Origen:';

  @override
  String get destinationLabel => 'Destino:';

  @override
  String get fareLabel => 'Tarifa: ';

  @override
  String get rideCompleted => 'Viaje completado';

  @override
  String get driverLabel => 'Conductor: ';

  @override
  String get vehicleNoLabel => 'N° de vehículo: ';

  @override
  String get vehicleLabel => 'Vehículo: ';

  @override
  String get languageLabel => 'Language: ';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get otpLabel => 'OTP: ';

  @override
  String get makePayment => 'Realizar pago';

  @override
  String get waitingForDriver => 'Esperando al conductor...';

  @override
  String get cancelRide => 'Cancelar viaje';

  @override
  String get startTypingHint => 'Empieza a escribir para ver sugerencias.';

  @override
  String get pickupHint => 'Lugar de recogida';

  @override
  String get destinationHint => '¿A dónde vas?';

  @override
  String get carName => 'Coche';

  @override
  String get autoName => 'Auto';

  @override
  String get motorcycleName => 'Motocicleta';

  @override
  String get rideCreated => '¡Viaje creado!';

  @override
  String get rideIdLabel => 'ID del viaje: ';

  @override
  String get panelHandleTapped => 'Mango del panel tocado';

  @override
  String get selectVehicle => 'Por favor selecciona un vehículo';

  @override
  String get errorPrefix => 'Error: ';

  @override
  String get noSuggestions => 'No se encontraron sugerencias.';

  @override
  String get startTyping => 'Empieza a escribir para ver sugerencias.';
}
