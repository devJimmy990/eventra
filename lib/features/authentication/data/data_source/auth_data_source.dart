import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:eventra/core/firebase/firebase.dart';
import 'package:eventra/features/landing/data/model/user.dart';

class AuthenticationDataSource {
  final Firebase firebase = Firebase();

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebase.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user!.uid;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return (await firebase.auth.signInWithCredential(credential)).user!.uid;
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
      User model, String password) async {
    try {
      var response = await firebase.auth.createUserWithEmailAndPassword(
        email: model.email,
        password: password,
      );
      if (response.user == null) throw Exception("error creating user");

      model.id = response.user!.uid;
      model.phone = response.user!.phoneNumber;
      model.avatar = response.user!.photoURL;
      bool isAdded = await setUserData(model);
      return isAdded ? model : null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> setUserData(User user) async {
    try {
      await firebase.store.collection("users").doc(user.id).set(user.toJson());
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> createUserWithEmailAndPassword2(
      String email, String password) async {
    try {
      var user = (await firebase.auth
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
      return user == null
          ? null
          : {
              "uid": user.uid,
              "avatar": user.photoURL ?? "",
              "phone": user.phoneNumber ?? "",
            };
    } catch (e) {
      rethrow;
    }
  }
}
