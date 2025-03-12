import 'package:eventra/core/firebase/firebase.dart';

class UserEventRequestDataSource {
  final Firebase _firebase = Firebase();

  Future<Map<String, dynamic>> bookEvent(Map<String, dynamic> event) async {
    try {
      final docId = _firebase.store.collection("requests").doc();
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
      final querySnapshot = await _firebase.store
          .collection('requests')
          .where('userId', isEqualTo: uid)
          .where('eventId', isEqualTo: eid)
          .limit(1)
          .get();
      if (querySnapshot.docs.isEmpty) return null;
      return querySnapshot.docs.first.data();
    } catch (e) {
      rethrow;
    }
  }
}
