import 'package:eventra/core/firebase/firebase.dart';
import 'package:eventra/features/admin/event/model/event.dart';

class EventDataSource {
  // firebase contain firestore used here  *singleton*
  final Firebase firebase = Firebase();

// add event to firestore
  Future<void> addEvent(Event event) async {
    try {
      await firebase.store.instance
          .collection('events')
          .doc(event.id)
          .set(event.toJson());
    } catch (e) {
      rethrow;
    }
  }

  // get event from firestore
  Stream<List<Event>> getEvents() {
    try {
      return firebase.store.instance
          .collection('events')
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

// update event on firestore
  Future<void> updateEvent(Event event) async {
    try {
      await firebase.store.instance
          .collection('events')
          .doc(event.id)
          .update(event.toJson());
    } catch (e) {
      rethrow;
    }
  }

// delete event from firestore
  Future<void> deleteEvent(Event event) async {
    try {
      await firebase.store.instance.collection('events').doc(event.id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
