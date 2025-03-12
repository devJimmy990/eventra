import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:eventra/features/user/home/cubit/event_state.dart';
import 'package:eventra/features/user/home/data/data_source/user_event_data_source.dart';
import 'package:eventra/features/user/home/data/repositories/user_event_repository.dart';

class UserEventCubit extends Cubit<UserEventState> {
  UserEventCubit() : super(EventInitial()) {
    getEvents();
  }
  List<UserEvent> list = [];
  Future<void> getEvents() async {
    emit(EventLoading());
    try {
      list = await UserEventRepository(UserEventDataSource()).getEvents();
      emit(list.isEmpty ? EventEmpty() : EventLoaded(list));
    } catch (e) {
      emit(EventError(e.toString()));
    }
  }
}
