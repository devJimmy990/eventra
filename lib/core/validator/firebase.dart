import 'package:eventra/core/helper/localization.dart';

class FirebaseValidator {
  FirebaseValidator();
  String login(String msg) {
    if (msg.contains("firebase_auth/invalid-email") ||
        msg.contains("firebase_auth/invalid-credential")) {
      return Localization.validatorFirebaseInvalidCredentials;
    }
    return msg;
  }

  String register(String msg) {
    if (msg.contains("firebase_auth/email-already-in-use")) {
      return Localization.validatorFirebaseUsedEmail;
    } else if (msg.contains("weak-password")) {
      return Localization.validatorFirebaseWeakPassword;
    }
    return msg;
  }
}
