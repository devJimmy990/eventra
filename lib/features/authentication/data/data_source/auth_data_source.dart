import 'package:google_sign_in/google_sign_in.dart';
import 'package:eventra/core/firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthenticationDataSource {
  final Firebase firebase = Firebase();

  Future<String> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebase.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user == null) {
        throw Exception("firebase_auth/invalid-credential");
      }
      return user.user!.uid;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final user = await firebase.auth.signInWithCredential(credential);
      if (user.user == null) {
        throw Exception("firebase_auth/invalid-credential");
      }
      return {
        "id": user.user!.uid,
        "email": user.user!.email,
        "name": user.user!.displayName,
        "phone": user.user!.phoneNumber,
      };
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

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await firebase.auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((response) {
        if (response.user == null) {
          throw Exception("firebase_auth/error-creating-user");
        }
        return response.user!.uid;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> setUserData(Map<String, dynamic> json) async {
    try {
      firebase.store.collection("users").doc(json["id"]).set(json);
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

  Future<String?> storeUserToken(String id) async {
    try {
      String? token = await firebase.messaging.getToken();
      if (token == null) throw Exception("error getting token");
      await firebase.store.collection("fcm").doc(id).set({
        "token": token,
      });
      return token;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteAccount(String id) async {
    try {
      await firebase.auth.currentUser!.delete();
      await firebase.store.collection("fcm").doc(id).delete();
      await firebase.store.collection("users").doc(id).delete();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> storeUserData(Map<String, dynamic> json) async {
    try {
      await firebase.store.collection("users").doc(json["id"]).set(json);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getUserById(String uid) async {
    try {
      await firebase.store.collection("users").doc(uid).get();
      return await firebase.store
          .collection("users")
          .doc(uid)
          .get()
          .then((value) => value.data()!);
    } catch (e) {
      rethrow;
    }
  }
}
