import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/user/home/data/model/booked_event.dart';
import 'package:eventra/features/user/home/cubit/event_state.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
import 'package:eventra/features/user/home/data/data_source/user_event_data_source.dart';
import 'package:eventra/features/user/home/data/repositories/user_event_repository.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());
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

  Future<void> bookEvent(UserEvent event) async {
    emit(EventLoading());
    try {
      final String uid = SharedPreference.getString(key: "uid")!;
      await UserEventRepository(UserEventDataSource()).bookEvent(
        RequestEvent(price: event.price, userId: uid, eventId: event.id!),
      );
      emit(state);
    } catch (e) {
      emit(EventError(e.toString()));
    }
  }
}
