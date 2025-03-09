import 'dart:io';

import 'package:eventra/core/firebase/firebase.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminEventDataSource {
  // firebase contain firestore used here  *singleton*
  final Firebase firebase = Firebase();

  Future<String> uploadImage(File image) async {
    try {
      String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";

      Reference ref = firebase.storage.ref().child("events/$fileName");

      UploadTask uploadTask = ref.putFile(image);

      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      rethrow;
    }
  }

// add event to firestore
  Future<Map<String, dynamic>> addEvent(AdminEvent event) async {
    try {
      var docRef = firebase.store.collection('events').doc();
      Map<String, dynamic> eventData = event.toJson();
      eventData['id'] = docRef.id;
      await docRef.set(eventData);
      return eventData;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createEventRequest(AdminEvent event) async {
    try {
      await firebase.store
          .collection('requests')
          .doc(event.id)
          .collection("events")
          .add(event.toJson());
    } catch (e) {
      rethrow;
    }
  }

  // get event from firestore
  Future<List<Map<String, dynamic>>> getEvents(String uid) async {
    try {
      return await firebase.store.collection('events').get().then((value) {
        return value.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

// update event on firestore
  Future<void> updateEvent(AdminEvent event) async {
    try {
      await firebase.store
          .collection('events')
          .doc(event.id)
          .update(event.toJson());
    } catch (e) {
      rethrow;
    }
  }

// delete event from firestore
  Future<void> deleteEvent(AdminEvent event) async {
    try {
      await firebase.store.collection('events').doc(event.id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
