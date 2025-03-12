import 'package:eventra/core/firebase/firebase.dart';

class UserEventDataSource {
  Firebase firebase = Firebase();

  Future<List<Map<String, dynamic>>> getEvents() async {
    try {
      return await firebase.store
          .collection("events")
          .get()
          .then((value) => value.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> bookEvent(Map<String, dynamic> event) async {
    try {
      final docId = firebase.store.collection("requests").doc();
      event['id'] = docId.id;
      await docId.set(event);
      return event;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> ifUserHasRequestWithEvent(
      {required String uid, required String eid}) async {
    try {
      final querySnapshot = await firebase.store
          .collection('requests')
          .where('userId', isEqualTo: uid)
          .where('eventId', isEqualTo: eid)
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) return null;
      return querySnapshot.docs.first.data();
    } catch (e) {
      rethrow;
    }
  }
}
