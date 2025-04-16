import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:eventra/features/user/home/cubit/event_state.dart';
import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:eventra/features/user/home/data/data_source/user_event_data_source.dart';
import 'package:eventra/features/user/home/data/repositories/user_event_repository.dart';

class UserEventCubit extends HydratedCubit<UserEventState> {
  final UserEventRepository _repository;
  StreamSubscription<List<UserEvent>>? _eventsSubscription;

  UserEventCubit({UserEventRepository? repository})
      : _repository = repository ?? UserEventRepository(UserEventDataSource()),
        super(EventInitial()) {
    _listenToEvents();
  }

  void _listenToEvents() {
    emit(EventLoading());

    _eventsSubscription = _repository.getEventsStream().listen(
      (events) {
        emit(events.isEmpty ? EventEmpty() : EventLoaded(events));
      },
      onError: (error) {
        emit(EventError(error.toString()));
      },
    );
  }

  @override
  Future<void> close() async {
    await _eventsSubscription?.cancel();
    return super.close();
  }

  @override
  UserEventState? fromJson(Map<String, dynamic> json) {
    try {
      final events = (json['events'] as List<dynamic>)
          .map((e) => UserEvent.fromJson(e))
          .toList();
      return EventLoaded(events);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserEventState state) {
    if (state is EventLoaded) {
      return {
        'events': state.events.map((e) => e.toJson()).toList(),
      };
    }
    return null;
  }
}
