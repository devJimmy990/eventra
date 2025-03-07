import 'package:eventra/core/firebase/firebase.dart';

class UserDataSource {
  final Firebase firebase = Firebase();

  Future<Map<String, dynamic>> getUserData(String uid) async {
    try {
      return {};
      // await firebase.store
      //     .collection("users")
      //     .doc(uid)
      //     .get()
      //     .then((value) => value.data() ?? {});
    } catch (e) {
      throw Exception('FirebaseStore: getUserData - Error: $e');
    }
  }
}
