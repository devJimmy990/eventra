import 'package:eventra/features/notification/data/data_source/notification_data_source.dart';
import 'package:eventra/features/notification/data/model/notification.dart';
import 'package:eventra/features/notification/data/repositories/notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/user/event/cubit/request_state.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:eventra/features/user/event/data/data_source/user_event_request_data_source.dart';
import 'package:eventra/features/user/event/data/repositories/user_event_request_repository.dart';

class UserEventRequestCubit extends Cubit<UserEventRequestState> {
  UserEventRequestCubit(String eventId) : super(EventRequestInitial()) {
    ifUserHasRequestWithEvent(eventId);
  }
  List<UserEvent> list = [];

  Future<void> bookEvent(UserEvent event, User user) async {
    emit(EventRequestLoading());
    try {
      final RequestEvent request =
          await UserEventRequestRepository(UserEventRequestDataSource())
              .bookEvent(
        RequestEvent(
          user: user,
          eventId: event.id!,
          eventName: event.title,
          admin: event.admin.id!,
        ),
      );

      /**
       * send notification to admin by admin token
       * call firebase to get admin token based on admin id
       * use notification repository to send token notification 
       */
      NotificationRepository(NotificationDataSource()).sendTokenNotification(
        await _getFCMToken(event.admin.id!),
        notification: Notification(
          title: event.title,
          body: "new book request",
        ),
      );
      emit(EventRequestLoaded(request));
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }

  Future<void> ifUserHasRequestWithEvent(String eventId) async {
    emit(EventRequestLoading());
    try {
      final String? uid = SharedPreference.getString(key: "uid");
      if (uid == null) {
        emit(EventRequestError("User ID not found"));
        return;
      }

      RequestEvent? request =
          await UserEventRequestRepository(UserEventRequestDataSource())
              .ifUserHasRequestWithEvent(userId: uid, eventId: eventId);

      if (request == null) {
        emit(EventRequestEmpty());
      } else {
        emit(EventRequestLoaded(request));
      }
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }

  Future<String> _getFCMToken(String id) async {
    try {
      return await NotificationRepository(NotificationDataSource())
          .getFCMToken(id);
    } catch (e) {
      rethrow;
    }
  }
}
