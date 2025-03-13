import 'package:eventra/core/firebase/firebase.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';

class AdminEventsRequestsDataSource {
  final Firebase _firebase = Firebase();

  Future<List<Map<String, dynamic>>> getAdminEventsRequests(String uid) async {
    try {
      return await _firebase.store
          .collection("requests")
          .where("admin", isEqualTo: uid)
          .get()
          .then((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onRequestApproved(RequestEvent request) async {
    try {
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onRejectRequest(
      {required String id, required Map<String, int> data}) async {
    try {
      print("reject-flow: data_source");
      await _firebase.store.collection("requests").doc(id).update(data);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onAcceptRequest(
      {required String id, required Map<String, int> data}) async {
    try {
      print("data_source: $data");
      await _firebase.store.collection("requests").doc(id).update(data);
      print("data_source: true");
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
