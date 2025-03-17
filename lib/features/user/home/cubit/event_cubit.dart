import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/user/home/cubit/event_state.dart';
import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:eventra/features/user/home/data/data_source/user_event_data_source.dart';
import 'package:eventra/features/user/home/data/repositories/user_event_repository.dart';

class UserEventCubit extends Cubit<UserEventState> {
  UserEventCubit() : super(EventInitial()) {
    _listenToEvents();
  }

  late StreamSubscription<List<UserEvent>> _eventsSubscription;

  void _listenToEvents() {
    emit(EventLoading());

    _eventsSubscription = UserEventRepository(UserEventDataSource())
        .getEventsStream()
        .listen((events) {
      emit(events.isEmpty ? EventEmpty() : EventLoaded(events));
    }, onError: (error) {
      emit(EventError(error.toString()));
    });
  }

  @override
  Future<void> close() {
    _eventsSubscription.cancel();
    return super.close();
  }
}
