import 'package:uber_clone/utils/constans/string_constant.dart';
import 'package:uber_clone/l10n/app_localizations.dart';

class GlobalValidator {
  
  static String? validateEmail(String? value,AppLocalizations localizations) {

    if (value == null || value.trim().isEmpty) {
      return localizations.emailRequired;
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return localizations.emailInvalid;
    }
    return null;
  }

  static String? validatePassword(String? value,AppLocalizations localizations) {
    if (value == null || value.isEmpty) {
      return localizations.passwordRequired;
    }
    if (value.length < 6) {
      return localizations.passwordMin;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
    AppLocalizations localizations,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return localizations.confirmPasswordRequired;
    }
    if (password != confirmPassword) {
      return localizations.passwordsDoNotMatch;
    }
    return null;
  }

  static String? validateFirstName(String? value,AppLocalizations localizations) {
    if (value == null || value.trim().isEmpty) {
      return localizations.firstNameRequired;
    }
    return null;
  }

  static String? validateLastName(String? value,AppLocalizations localizations) {
    if (value == null || value.trim().isEmpty) {
      return localizations.lastNameRequired;
    }
    return null;
  }

  static String? validateVehicleColor(String? value,AppLocalizations localizations) {
    if (value == null || value.trim().isEmpty) {
      return localizations.vehicleColorRequired;
    }
    return null;
  }

  static String? validateVehiclePlate(String? value,AppLocalizations localizations) {
    if (value == null || value.trim().isEmpty) {
      return localizations.vehiclePlateRequired;
    }
    return null;
  }

  static String? validateVehicleCapacity(String? value,AppLocalizations localizations) {
    if (value == null || value.trim().isEmpty) {
      return localizations.vehicleCapacityRequired;
    }
    final intValue = int.tryParse(value.trim());
    if (intValue == null || intValue <= 0) {
      return localizations.vehicleCapacityInvalid;
    }
    return null;
  }

  static String? validateVehicleType(String? value,AppLocalizations localizations) {
    if (value == null || value.trim().isEmpty) {
      return localizations.vehicleTypeRequired;
    }
    return null;
  }
}