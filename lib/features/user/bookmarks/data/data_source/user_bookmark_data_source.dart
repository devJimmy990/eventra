import 'package:eventra/core/firebase/firebase.dart';

class UserBookmarkDataSource {
  Firebase firebase = Firebase();

  Future<Map<String, dynamic>> addBookmarkEvent(
      Map<String, dynamic> event, String uid) async {
    try {
      final docId = firebase.store
          .collection("users")
          .doc(uid)
          .collection("favorites")
          .doc();
      event['id'] = docId.id;
      await docId.set(event);
      return event;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getBookmarkedEvents(uid) async {
    try {
      return await firebase.store
          .collection("users")
          .doc(uid)
          .collection("favorites")
          .get()
          .then((value) => value.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      rethrow;
    }
  }
}
