import 'package:flutter/material.dart';
import 'package:eventra/core/helper/localization.dart';

class FirebaseValidator {
  final Localization _strings;
  FirebaseValidator(BuildContext context) : _strings = Localization(context);
  String login(String msg) {
    if (msg.contains("firebase_auth/invalid-email") ||
        msg.contains("firebase_auth/invalid-credential")) {
      return _strings.validatorFirebaseInvalidCredentials;
    }
    return msg;
  }

  String register(String msg) {
    if (msg.contains("firebase_auth/email-already-in-use")) {
      return _strings.validatorFirebaseUsedEmail;
    } else if (msg.contains("weak-password")) {
      return _strings.validatorFirebaseWeakPassword;
    }
    return msg;
  }
}
