import 'dart:io';

import 'package:eventra/core/firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

  Future<String> uploadImage(File image) async {
    try {
      String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";

      Reference ref = firebase.storage.ref().child("users/$fileName");

      UploadTask uploadTask = ref.putFile(image);

      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateUserProfile(String? uid, Map<String, String> data) async {
    try {
      await firebase.store.collection("users").doc(uid).update(data);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
