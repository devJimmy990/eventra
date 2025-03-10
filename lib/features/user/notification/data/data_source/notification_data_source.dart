import 'package:eventra/core/firebase/firebase.dart';

class NotificationDataSource {
  final Firebase firebase = Firebase();

  Future<List<Map<String, dynamic>>> getNotifications(String uid) async {
    try {
      return await firebase.store
          .collection("users")
          .doc(uid)
          .collection("notifications")
          .get()
          .then((value) => value.docs.map((n) => n.data()).toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addNotification(
      Map<String, dynamic> data, String uid) async {
    try {
      final docId = firebase.store
          .collection("users")
          .doc(uid)
          .collection("notifications")
          .doc();
      data.addAll({"id": docId.id});
      docId.set(data);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
