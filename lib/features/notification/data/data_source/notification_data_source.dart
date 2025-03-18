import 'package:eventra/core/firebase/firebase.dart';
import 'package:eventra/core/helper/connection.dart';

class NotificationDataSource {
  final Firebase _firebase = Firebase();
  final Connection _connection = Connection();

  Future<bool> sendTopicNotification(String topic,
      {required Map<String, String> payload}) async {
    try {
      await _connection.sendTopicNotification(topic, payload: payload);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> sendTokenNotification(String token,
      {required Map<String, String> payload}) async {
    try {
      await _connection.sendTokenNotification(token, payload: payload);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> subscribeToUserTopics(List<String> topics) async {
    try {
      for (var topic in topics) {
        await _firebase.messaging.subscribeToTopic(topic);
      }
      return await _firebase.messaging.getToken();
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> subscribeToAdminTopics(List<String> topics) async {
    try {
      for (var topic in topics) {
        await _firebase.messaging.subscribeToTopic(topic);
      }
      return await _firebase.messaging.getToken();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getFCMToken(String id) async {
    try {
      return await _firebase.store
          .collection("fcm")
          .doc(id)
          .get()
          .then((value) => value.data()!["token"]!);
    } catch (e) {
      rethrow;
    }
  }
}
