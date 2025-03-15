import 'package:flutter/material.dart';
import 'package:eventra/core/constants/regex.dart';
import 'package:eventra/core/helper/localization.dart';

class InputValidator {
  final Localization strings;
  InputValidator(BuildContext context) : strings = Localization();

  String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    } else if (value.length < 3) {
      return Localization.validatorShortName;
    } else if (value.length > 25) {
      return Localization.validatorLongName;
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    } else if (!Regex.matchPhone(value)) {
      return Localization.validatorInvalidPhone;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    } else if (!Regex.matchEmail(value)) {
      return Localization.validatorInvalidEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    } else if (value.length < 6) {
      return Localization.validatorShortPassword;
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    } else if (value != password) {
      return Localization.validatorPasswordNotMatch;
    }
    return null;
  }
}
