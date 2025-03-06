import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  auth.FirebaseAuth get instance => _auth;

  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user!.uid;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return (await _auth.signInWithCredential(credential)).user!.uid;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
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
