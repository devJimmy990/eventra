import 'package:eventra/core/firebase/firebase.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';

class EventDataSource {
  // firebase contain firestore used here  *singleton*
  final Firebase firebase = Firebase();

// add event to firestore
  Future<void> addEvent(AdminEvent event) async {
    try {
      await firebase.store
          .collection('events')
          .doc(event.id)
          .set(event.toJson());
    } catch (e) {
      rethrow;
    }
  }

  // get event from firestore
  Stream<List<AdminEvent>> getEvents() {
    try {
      return firebase.store.collection('events').snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => AdminEvent.fromJson(doc.data())).toList();
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
