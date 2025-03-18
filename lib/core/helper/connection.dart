import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';

class Connection {
  static Connection? _instance;
  static AutoRefreshingAuthClient? _client;
  Connection._() {
    _getAuthorizedClient();
  }
  factory Connection() => _instance ??= Connection._();

  Future<void> _getAuthorizedClient() async {
    try {
      final serviceAccountJson =
          await rootBundle.loadString('assets/files/eventra-firebase.json');

      final serviceAccountCredentials =
          ServiceAccountCredentials.fromJson(serviceAccountJson);

      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

      _client =
          await clientViaServiceAccount(serviceAccountCredentials, scopes);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendTopicNotification(String topic,
      {required Map<String, String> payload}) async {
    try {
      await _client!.post(
        Uri.parse(
            "https://fcm.googleapis.com/v1/projects/eventra-1eb59/messages:send"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "message": {"topic": topic, "notification": payload}
        }),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendTokenNotification(String token,
      {required Map<String, String> payload}) async {
    try {
      await _client!.post(
        Uri.parse(
            "https://fcm.googleapis.com/v1/projects/eventra-1eb59/messages:send"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "message": {
            "token":
                "fuDSzUH0RZqG_ghUJMEdai:APA91bGCCJxfk86YfLakePy2B5Nuuh9uSqxMrBcWmY98YzetinRMH7_IzwN8Bav1rh_eodgqufjK1bB34plG_5t3yAolT196dGQt35HiYuy-9nsz9-EZhbg",
            "notification": payload
          }
        }),
      );
    } catch (e) {
      rethrow;
    }
  }

 static void dispose() {
    if (_client != null) {
      _client!.close();
      _client = null;
      print("debug: Client closed");
    }
  }
}
