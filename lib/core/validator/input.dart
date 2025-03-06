import 'package:eventra/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:eventra/core/constants/regex.dart';

class InputValidator {
  final BuildContext _context;
  InputValidator(BuildContext context) : _context = context;
  String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(_context).empty;
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(_context).empty;
    } else if (value.length < 3) {
      return "Name is too short";
    } else if (value.length > 25) {
      return "Name must be less than 25 characters";
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(_context).empty;
    } else if (!Regex.matchPhone(value)) {
      return "invalid phone number format e.g. 0128223643";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(_context).empty;
    } else if (!Regex.matchEmail(value)) {
      return "invalid email format e.g. abc@email.com";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(_context).empty;
    } else if (value.length < 6) {
      return "Password must be more than 6 characters";
    }

    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return S.of(_context).empty;
    } else if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
