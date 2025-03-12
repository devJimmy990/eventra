import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/user/home/data/model/booked_event.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
import 'package:eventra/features/user/home/cubit/request/request_state.dart';
import 'package:eventra/features/user/home/data/data_source/user_event_data_source.dart';
import 'package:eventra/features/user/home/data/repositories/user_event_repository.dart';

class UserEventRequestCubit extends Cubit<UserEventRequestState> {
  UserEventRequestCubit(String eventId) : super(EventRequestInitial()) {
    print("UserEventRequest - constructor");
    ifUserHasRequestWithEvent(eventId);
  }
  List<UserEvent> list = [];

  Future<void> bookEvent(UserEvent event) async {
    emit(EventRequestLoading());
    try {
      final String uid = SharedPreference.getString(key: "uid")!;
      await UserEventRepository(UserEventDataSource()).bookEvent(
        RequestEvent(userId: uid, eventId: event.id!),
      );
      emit(EventRequestCreated());
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }

  Future<void> ifUserHasRequestWithEvent(String eventId) async {
    emit(EventRequestLoading());
    try {
      print("ifUserHasRequestWithEvent - function");

      final String uid = SharedPreference.getString(key: "uid")!;
      RequestEvent? request = await UserEventRepository(UserEventDataSource())
          .ifUserHasRequestWithEvent(userId: uid, eventId: eventId);
      emit(request == null ? EventRequestEmpty() : EventRequestLoaded(request));
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }
}
