import 'package:eventra/core/firebase/firebase.dart';

class UserDataSource {
  final Firebase firebase = Firebase();

  Future<Map<String, dynamic>> getUserData(String uid) async {
    try {
      return await firebase.store
          .collection("users")
          .doc(uid)
          .get()
          .then((value) => value.data()!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserData(
      String uid, Map<String, dynamic> updatedData) async {
    try {
      await firebase.store.collection("users").doc(uid).update(updatedData);
    } catch (e) {
      rethrow;
    }
  }
}
