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
}
