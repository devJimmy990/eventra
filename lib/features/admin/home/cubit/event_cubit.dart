import 'dart:io';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/admin/event/extension/event_status.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/home/data/repositories/event_repository.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/data_source/event_data_source.dart';

part 'event_state.dart';

enum EventFilter { all, upcoming, past }

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial()) {
    getEvents(EventFilter.all);
  }

  List<AdminEvent> _events = [];

  void getEvents(EventFilter filter) async {
    emit(EventLoading());
    try {
      final String uid = SharedPreference.getString(key: "uid")!;
      _events = await EventRepository(EventDataSource()).getEvents(uid);
      List<AdminEvent> filtered;
      if (filter == EventFilter.upcoming) {
        filtered = _events.where((event) => event.isUpcoming).toList();
      } else if (filter == EventFilter.past) {
        filtered = _events.where((event) => event.isPast).toList();
      } else {
        filtered = _events;
      }

      // List<AdminEvent> filteredEvents =
      //     _events.where((event) => event.isUpcoming).toList();
      // emit(EventLoaded(filteredEvents));
      emit(filtered.isEmpty ? EventEmpty() : EventLoaded(filtered));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }
  //
  // void getUpcomingEvents() {
  //   try {
  //     List<AdminEvent> upcoming =
  //         _events.where((event) => event.isUpcoming).toList();
  //     emit(upcoming.isEmpty ? EventEmpty() : EventLoaded(upcoming));
  //   } catch (e) {
  //     emit(EventError(message: e.toString()));
  //   }
  // }
  //
  // void getPastEvents() {
  //   try {
  //     List<AdminEvent> past = _events.where((event) => event.isPast).toList();
  //     emit(past.isEmpty ? EventEmpty() : EventLoaded(past));
  //   } catch (e) {
  //     emit(EventError(message: e.toString()));
  //   }
  // }

  Future<void> addEvent(AdminEvent event) async {
    emit(EventLoading());
    try {
      final String id =
          await EventRepository(EventDataSource()).addEvent(event);
      event.id = id;
      event.attendees = [
        User.event(
          id: "1",
          name: "John Doe",
          email: "K0eXg@example.com",
          avatar:
              "https://firebasestorage.googleapis.com/v0/b/eventra-1eb59.firebasestorage.app/o/events%2F1741408725868.jpg?alt=media&token=1b9ad231-b257-4fed-a14d-d90b7c52ec42",
        ),
        User.event(
          id: "2",
          name: "Jane Doe",
          email: "K0eXg@example.com",
        ),
      ];

      _events.add(event);
      List<AdminEvent> upcoming = _events.where((e) => e.isUpcoming).toList();
      emit(upcoming.isEmpty
          ? EventEmpty()
          : EventLoaded(upcoming)); //todo done by chatGPT :D
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> updateEvent(AdminEvent event) async {
    emit(EventLoading());
    try {
      //apply updates
      await EventRepository(EventDataSource()).updateEvent(event);
      emit(EventLoaded(_events));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  // Future<void> deleteEvent(AdminEvent event) async {
  //   emit(EventLoading());
  //   try {
  //     await EventRepository(EventDataSource()).deleteEvent(event);
  //   } catch (e) {
  //     emit(EventError(message: e.toString()));
  //   }
  // }
  Future<void> deleteEvent(AdminEvent event) async {
    emit(EventLoading());
    try {
      await EventRepository(EventDataSource()).deleteEvent(event);
      _events.removeWhere((e) => e.id
          == event.id);
      // Reapply current filter
      debugPrint(
        'events ${_events.length}'
      );
      emit(_events.isEmpty ? EventEmpty() : EventLoaded(_events));
    } catch (e) {
      debugPrint('problem ${e.toString()}');
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> uploadImage(File image) async {
    emit(ImageUploading());
    try {
      String url = await EventRepository(EventDataSource()).uploadImage(image);
      emit(ImageUploaded(url));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

// void filterEvents() {
//   debugPrint("TESESt");
//   try {
//     List<AdminEvent> filteredEvents =
//         _events.where((event) => event.isUpcoming).toList();
//     debugPrint(filteredEvents.length.toString()); //testing
//     emit(EventLoaded(filteredEvents));
//   } catch (e) {
//     emit(EventError(message: e.toString()));
//   }
// }
}
