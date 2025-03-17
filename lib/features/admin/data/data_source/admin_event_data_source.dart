import 'dart:convert';
import 'dart:io';

import 'package:eventra/core/firebase/firebase.dart';
import 'package:eventra/features/admin/data/model/admin_event.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';

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
      await sendFirebaseMessage();
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
      return await firebase.store
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
      await firebase.store.collection('events').doc(id).update(data);
      return true;
    } catch (e) {
      rethrow;
    }
  }

// delete event from firestore
  Future<bool> deleteEvent(String id) async {
    try {
      await firebase.store.collection('events').doc(id).delete();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendFirebaseMessage() async {
    try {
      final serviceAccountJson =
          await rootBundle.loadString('assets/files/eventra-firebase.json');

      final serviceAccountCredentials =
          ServiceAccountCredentials.fromJson(serviceAccountJson);

      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

      var client =
          await clientViaServiceAccount(serviceAccountCredentials, scopes);

      final projectId = 'eventra-1eb59';
      final url =
          'https://fcm.googleapis.com/v1/projects/$projectId/messages:send';

      final messagePayload = {
        "message": {
          "topic": "new_event",
          "notification": {"title": "Eventra", "body": "New Upcoming Event"},
        }
      };

      await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(messagePayload),
      );

      client.close();
    } catch (e) {
      rethrow;
    }
  }
}
