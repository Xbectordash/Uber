import 'package:uber_clone/utils/constans/string_constant.dart';

class GlobalValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return StringConstant.emailRequired;
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return StringConstant.emailInvalid;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstant.passwordRequired;
    }
    if (value.length < 6) {
      return StringConstant.passwordMin;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return StringConstant.confirmPasswordRequired;
    }
    if (password != confirmPassword) {
      return StringConstant.passwordsDoNotMatch;
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return StringConstant.firstNameRequired;
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return StringConstant.lastNameRequired;
    }
    return null;
  }

  static String? validateVehicleColor(String? value) {
    if (value == null || value.trim().isEmpty) {
      return StringConstant.vehicleColorRequired;
    }
    return null;
  }

  static String? validateVehiclePlate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return StringConstant.vehiclePlateRequired;
    }
    return null;
  }

  static String? validateVehicleCapacity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return StringConstant.vehicleCapacityRequired;
    }
    final intValue = int.tryParse(value.trim());
    if (intValue == null || intValue <= 0) {
      return StringConstant.vehicleCapacityInvalid ??
          'Invalid vehicle capacity';
    }
    return null;
  }

  static String? validateVehicleType(String? value) {
    if (value == null || value.trim().isEmpty) {
      return StringConstant.vehicleTypeRequired;
    }
    return null;
  }
}
