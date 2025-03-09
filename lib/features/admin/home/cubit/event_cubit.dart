import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/data_source/event_data_source.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/admin/home/cubit/event_state.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/event/extension/event_status.dart';
import 'package:eventra/features/admin/home/data/repositories/event_repository.dart';

enum EventFilter { upcoming, past }

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial()) {
    getEvents();
  }

  final List<AdminEvent> _upcomingEvents = [];
  final List<AdminEvent> _previousEvents = [];

  void getEvents() async {
    emit(EventLoading());
    try {
      final String uid = SharedPreference.getString(key: "uid")!;
      List<AdminEvent> events =
          await EventRepository(EventDataSource()).getEvents(uid);
      _handleEventDate(events);
      emit(_upcomingEvents.isEmpty
          ? EventEmpty()
          : EventLoaded(_upcomingEvents));
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

      _upcomingEvents.add(event);
      emit(EventLoaded(_upcomingEvents)); //todo done by chatGPT :D
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> updateEvent(AdminEvent event) async {
    emit(EventLoading());
    try {
      //apply updates
      await EventRepository(EventDataSource()).updateEvent(event);
      int index = _upcomingEvents.indexWhere((e) => e == event);
      _upcomingEvents[index] = event;
      emit(EventLoaded(_upcomingEvents));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> deleteEvent(AdminEvent event) async {
    try {
      await EventRepository(EventDataSource()).deleteEvent(event);
      _upcomingEvents.removeWhere((e) => e == event);
      emit(_upcomingEvents.isEmpty
          ? EventEmpty()
          : EventLoaded(_upcomingEvents));
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

  void filterEvents(EventFilter filter) {
    switch (filter) {
      case EventFilter.upcoming:
        emit(EventLoaded(_upcomingEvents));
        break;
      case EventFilter.past:
        emit(EventLoaded(_previousEvents));
        break;
    }
  }

  void _handleEventDate(List<AdminEvent> events) {
    for (AdminEvent event in events) {
      if (event.isUpcoming) {
        _upcomingEvents.add(event);
      } else {
        _previousEvents.add(event);
      }
    }
  }

  List<AdminEvent> get upcomingEvents => _upcomingEvents;
  List<AdminEvent> get previousEvents => _previousEvents;
}
