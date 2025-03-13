import 'dart:io';
import 'package:eventra/features/admin/data/data_source/admin_event_data_source.dart';
import 'package:eventra/features/admin/data/repositories/admin_event_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/admin/cubit/event/event_state.dart';
import 'package:eventra/features/admin/data/model/admin_event.dart';
import 'package:eventra/features/admin/extension/event_status.dart';

enum EventFilter { upcoming, past }

class AdminEventCubit extends Cubit<AdminEventState> {
  AdminEventCubit() : super(EventInitial()) {
    getEvents();
  }

  final List<AdminEvent> _upcomingEvents = [];
  final List<AdminEvent> _previousEvents = [];

  void getEvents() async {
    emit(EventLoading());
    try {
      final String uid = SharedPreference.getString(key: "uid")!;
      List<AdminEvent> events =
          await AdminEventRepository(AdminEventDataSource()).getEvents(uid);
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
      event =
          await AdminEventRepository(AdminEventDataSource()).addEvent(event);
      _upcomingEvents.add(event);
      emit(EventLoaded(_upcomingEvents));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> updateEvent(AdminEvent event) async {
    emit(EventLoading());
    try {
      await AdminEventRepository(AdminEventDataSource()).updateEvent(event);
      int index = _upcomingEvents.indexWhere((e) => e == event);
      _upcomingEvents[index] = event;
      emit(EventLoaded(_upcomingEvents));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> deleteEvent(AdminEvent event) async {
    try {
      await AdminEventRepository(AdminEventDataSource()).deleteEvent(event);
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
      String url =
          await AdminEventRepository(AdminEventDataSource()).uploadImage(image);
      emit(ImageUploaded(url));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  void filterEvents(EventFilter filter) {
    switch (filter) {
      case EventFilter.upcoming:
        emit(_upcomingEvents.isEmpty
            ? EventEmpty()
            : EventLoaded(_upcomingEvents));
        break;
      case EventFilter.past:
        emit(_previousEvents.isEmpty
            ? EventEmpty()
            : EventLoaded(_previousEvents));
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

}
