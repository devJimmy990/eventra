import 'dart:io';
import 'package:eventra/features/notification/data/data_source/notification_data_source.dart';
import 'package:eventra/features/notification/data/model/notification.dart';
import 'package:eventra/features/notification/data/repositories/notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/admin/data/model/admin_event.dart';
import 'package:eventra/features/admin/extension/event_status.dart';
import 'package:eventra/features/admin/cubit/event/event_state.dart';
import 'package:eventra/features/admin/data/data_source/admin_event_data_source.dart';
import 'package:eventra/features/admin/data/repositories/admin_event_repository.dart';

enum EventFilter { upcoming, past }

enum EventAction { add, update, delete }

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
      event = //add new Event
          await AdminEventRepository(AdminEventDataSource()).addEvent(event);
      _upcomingEvents.add(event);

      /** send event notification to all users */
      NotificationRepository(NotificationDataSource()).sendTopicNotification(
        "new_event",
        notification: Notification(
          title: event.title,
          body: "New Upcoming Event",
        ),
      );
      emit(EventLoaded(
        _upcomingEvents,
        action: EventAction.add,
      ));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> updateEvent(AdminEvent event) async {
    emit(EventLoading());
    try {
      bool res = await AdminEventRepository(AdminEventDataSource())
          .updateEvent(event.id!, data: event.toJson());
      if (res) {
        int index = _upcomingEvents.indexWhere((e) => e.id == event.id);
        _upcomingEvents[index] = event;
        emit(EventLoaded(
          _upcomingEvents,
          action: EventAction.update,
        ));
      }
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> deleteEvent(AdminEvent event) async {
    try {
      bool res = await AdminEventRepository(AdminEventDataSource())
          .deleteEvent(event.id!);
      if (res) {
        _upcomingEvents.removeWhere((e) => e == event);
        emit(_upcomingEvents.isEmpty
            ? EventEmpty()
            : EventLoaded(
                _upcomingEvents,
                action: EventAction.delete,
              ));
      }
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
