import 'package:cloud_firestore/cloud_firestore.dart';

class UserEventDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getEventsStream() {
    return firestore
        .collection("events")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}