import 'dart:io';
import 'package:eventra/core/firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminEventDataSource {
  // firebase contain firestore used here  *singleton*
  final Firebase _firebase = Firebase();

  Future<String> uploadImage(File image) async {
    try {
      String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";

      Reference ref = _firebase.storage.ref().child("events/$fileName");

      UploadTask uploadTask = ref.putFile(image);

      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      rethrow;
    }
  }

// add event to firestore
  Future<Map<String, dynamic>> addEvent(Map<String, dynamic> event) async {
    try {
      var docRef = _firebase.store.collection('events').doc();
      event['id'] = docRef.id;
      await docRef.set(event);
      return event;
    } catch (e) {
      rethrow;
    }
  }

  // get event from firestore
  Future<List<Map<String, dynamic>>> getEvents(String uid) async {
    try {
      return await _firebase.store
          .collection('events')
          .where("admin.id", isEqualTo: uid)
          .get()
          .then((value) {
        return value.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

// update event on firestore
  Future<bool> updateEvent(String id,
      {required Map<String, dynamic> data}) async {
    try {
      await _firebase.store.collection('events').doc(id).update(data);
      return true;
    } catch (e) {
      rethrow;
    }
  }

// delete event from firestore
  Future<bool> deleteEvent(String id) async {
    try {
      await _firebase.store.collection('events').doc(id).delete();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
