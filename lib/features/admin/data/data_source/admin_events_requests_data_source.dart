import 'package:eventra/core/firebase/firebase.dart';

class AdminEventsRequestsDataSource {
  final Firebase firebase = Firebase();

  Future<List<Map<String, dynamic>>> getAdminEventsRequests(String uid) async {
    try {
      return await firebase.store
          .collection("requests")
          .where("adminId", isEqualTo: uid)
          .get()
          .then((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      rethrow;
    }
  }
}
