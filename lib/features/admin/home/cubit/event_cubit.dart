import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/home/data/repositories/event_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_source/event_data_source.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final eventRepository = EventRepository(EventDataSource());

  EventCubit() : super(EventInitial());

  void getEvents() {
    emit(EventLoading());
    eventRepository.getEvents().listen(
      (events) {
        if (events.isEmpty) {
          emit(EventEmpty());
        } else {
          emit(EventLoaded(events: events));
        }
      },
      onError: (e) {
        emit(EventError(message: e.toString()));
      },
    );
  }

  Future<void> addEvent(AdminEvent event) async {
    try {
      await eventRepository.addEvent(event);
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> updateEvent(AdminEvent event) async {
    emit(EventLoading());
    try {
      await eventRepository.updateEvent(event);
      getEvents();
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> deleteEvent(AdminEvent event) async {
    emit(EventLoading());
    try {
      await eventRepository.deleteEvent(event);
      getEvents();
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }
}
