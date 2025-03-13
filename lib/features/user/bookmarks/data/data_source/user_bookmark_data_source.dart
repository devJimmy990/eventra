import 'package:eventra/core/firebase/firebase.dart';
class UserBookmarkDataSource {
  Firebase firebase = Firebase();

  Future<Map<String, dynamic>> addBookmarkEvent(
      Map<String, dynamic> event, String uid) async {
    try {
      final collectionRef = firebase.store
          .collection("users")
          .doc(uid)
          .collection("favorites");

      final existingDoc = await collectionRef
          .where("id", isEqualTo: event["id"])
          .get();
      if (existingDoc.docs.isEmpty) {
        final docId = collectionRef.doc(event["id"]);
        await docId.set(event);

      }
      // if (existingDoc.docs.isEmpty) {
      //   final docId = collectionRef.doc();
      //   event['id'] = docId.id;
      //   debugPrint("saving with event id: ${event["id"]}");
      //   await docId.set(event);
      // }

      return event;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getBookmarkedEvents(String uid) async {
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

  Future<void> removeBookmarkEvent(String eventId, String uid) async {
    try {
      await firebase.store
          .collection("users")
          .doc(uid)
          .collection("favorites")
          .doc(eventId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}