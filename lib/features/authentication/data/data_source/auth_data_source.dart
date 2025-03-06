import 'package:eventra/core/firebase/firebase.dart';
import 'package:eventra/features/landing/data/model/user.dart';

class AuthenticationDataSource {
  final Firebase firebase = Firebase();

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await firebase.auth.signInWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> loginWithGoogle() async {
    try {
      return await firebase.auth.signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    try {
      await firebase.auth.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      User user, String password) async {
    try {
      Map<String, dynamic>? response = await firebase.auth
          .createUserWithEmailAndPassword(user.email, password);
      if (response == null) return null;
      user.id = response['uid'];
      user.phone = response['phone'];
      user.avatar = response['avatar'];
      bool isAdded = await setUserData(user);
      return isAdded ? user : null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> setUserData(User user) async {
    try {
      await firebase.store.instance
          .collection("users")
          .doc(user.id)
          .set(user.toJson());
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
