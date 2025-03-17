import 'package:eventra/core/firebase/firebase.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';

class AdminEventsRequestsDataSource {
  final Firebase _firebase = Firebase();

  Stream<List<Map<String, dynamic>>> getAdminEventsRequests(String uid) {
    try {
      return _firebase.store
          .collection("requests")
          .where("admin", isEqualTo: uid)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onRequestApproved(RequestEvent request) async {
    try {
      await _firebase.store
          .collection("requests")
          .doc(request.id)
          .update({"status": 3}).then((val) async {
        _firebase.store
            .collection("events")
            .doc(request.eventId)
            .collection("attendees")
            .doc(request.user.id);
      });

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onRejectRequest(
      {required String id, required Map<String, int> data}) async {
    try {
      await _firebase.store.collection("requests").doc(id).update(data);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onAcceptRequest(
      {required String id, required Map<String, int> data}) async {
    try {
      await _firebase.store.collection("requests").doc(id).update(data);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
