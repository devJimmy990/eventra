import 'package:eventra/generated/l10n.dart';
import 'package:flutter/material.dart';

class FirebaseValidator {
  final BuildContext _context;
  FirebaseValidator(BuildContext context) : _context = context;
  String login(String msg) {
    if (msg.contains("firebase_auth/invalid-email") ||
        msg.contains("firebase_auth/invalid-credential")) {
      return "invalid email or password";
    }
    return msg;
  }

  String register(String msg) {
    if (msg.contains("firebase_auth/email-already-in-use")) {
      return S.of(_context).usedEmail;
    } else if (msg.contains("weak-password")) {
      return "password is too weak";
    }
    return msg;
  }
}
