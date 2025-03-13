import 'package:flutter/material.dart';
import 'package:eventra/core/constants/regex.dart';
import 'package:eventra/core/helper/localization.dart';

class InputValidator {
  final Localization strings;
  InputValidator(BuildContext context) : strings = Localization(context);

  String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return strings.validatorEmpty;
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return strings.validatorEmpty;
    } else if (value.length < 3) {
      return strings.validatorShortName;
    } else if (value.length > 25) {
      return strings.validatorLongName;
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return strings.validatorEmpty;
    } else if (!Regex.matchPhone(value)) {
      return strings.validatorInvalidPhone;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return strings.validatorEmpty;
    } else if (!Regex.matchEmail(value)) {
      return strings.validatorInvalidEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return strings.validatorEmpty;
    } else if (value.length < 6) {
      return strings.validatorShortPassword;
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return strings.validatorEmpty;
    } else if (value != password) {
      return strings.validatorPasswordNotMatch;
    }
    return null;
  }
}
