import 'dart:io';

import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/home/data/repositories/event_repository.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_source/event_data_source.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial()) {
    getEvents();
  }
  List<AdminEvent> _events = [];
  void getEvents() async {
    emit(EventLoading());
    try {
      final String uid = SharedPreference.getString(key: "uid")!;
      _events = await EventRepository(EventDataSource()).getEvents(uid);
      print("length: ${_events.length}");
      emit(_events.isEmpty ? EventEmpty() : EventLoaded(_events));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

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
      emit(EventLoaded(_events));
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

  Future<void> deleteEvent(AdminEvent event) async {
    emit(EventLoading());
    try {
      await EventRepository(EventDataSource()).deleteEvent(event);
      getEvents();
    } catch (e) {
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
}
