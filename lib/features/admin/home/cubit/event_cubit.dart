import 'package:bloc/bloc.dart';
import 'package:eventra/features/admin/event/model/event.dart';
import 'package:eventra/features/admin/home/data/repositories/event_repository.dart';

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
        }
        else {
          emit(Eventloaded(events: events));
        }
      },
      onError: (e) {
        emit(EventError(message: e.toString()));
      },
    );
  }

  Future<void> addEvent(Event event) async {
    try {
      await eventRepository.addEvent(event);
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> updateEvent(Event event) async {
    emit(EventLoading());
    try {
      await eventRepository.updateEvent(event);
      getEvents();
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }

  Future<void> deleteEvent(Event event) async {
    emit(EventLoading());
    try {
      await eventRepository.deleteEvent(event);
      getEvents();
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }
}
