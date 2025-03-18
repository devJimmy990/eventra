import 'dart:async';

import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/admin/cubit/requests/request_state.dart';
import 'package:eventra/features/admin/data/data_source/admin_events_requests_data_source.dart';
import 'package:eventra/features/admin/data/repositories/admin_events_requests_repository.dart';
import 'package:eventra/features/notification/data/data_source/notification_data_source.dart';
import 'package:eventra/features/notification/data/model/notification.dart';
import 'package:eventra/features/notification/data/repositories/notification_repository.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminEventRequestCubit extends Cubit<AdminEventRequestState> {
  AdminEventRequestCubit() : super(EventRequestInitial()) {
    getRequests();
  }
  List<RequestEvent> _requests = [];
  late StreamSubscription<List<RequestEvent>> _eventsSubscription;

  void getRequests() {
    emit(EventRequestLoading());
    try {
      String uid = SharedPreference.getString(key: "uid")!;
      _eventsSubscription =
          AdminEventsRequestsRepository(AdminEventsRequestsDataSource())
              .getAdminEventsRequests(uid)
              .listen((requests) {
        _requests = requests;
        filteredRequests();
      }, onError: (error) => emit(EventRequestError(error)));
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }

  Future<void> onAcceptRequest(RequestEvent request) async {
    try {
      bool data =
          await AdminEventsRequestsRepository(AdminEventsRequestsDataSource())
              .onAcceptRequest(
        request.id!,
        data: {"status": 2},
      );
      if (data) {
        _updateRequestStatus(request.id!, RequestStatus.pending);
        /**
         * after the request is accepted by admin
         * user should be notified of the request status
         */
        NotificationRepository(NotificationDataSource()).sendTokenNotification(
          await _getFCMToken(request.user.id!),
          notification: Notification(
            body:
                "your request is accepted, don`t forget to be available at the time",
            title: request.eventName,
          ),
        );

        filteredRequests();
      }
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }

  Future<void> onRejectRequest(RequestEvent request) async {
    try {
      bool data =
          await AdminEventsRequestsRepository(AdminEventsRequestsDataSource())
              .onRejectRequest(
        request.id!,
        data: {"status": 1},
      );
      if (data) {
        _updateRequestStatus(request.id!, RequestStatus.rejected);
        /**
         * after the request is rejected by admin
         * user should be notified of the request status
         */
        NotificationRepository(NotificationDataSource()).sendTokenNotification(
          await _getFCMToken(request.user.id!),
          notification: Notification(
            body:
                "we are very sorry, the attendees list is full.. you will be in waiting list",
            title: request.eventName,
          ),
        );
        filteredRequests();
      }
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }

  Future<void> onRequestApproved(RequestEvent request) async {
    try {
      bool data =
          await AdminEventsRequestsRepository(AdminEventsRequestsDataSource())
              .onRequestApproved(request);

      if (data) {
        /**
         * after the request is approved by admin
         * this mean the attendee in event place and ready to enter
         * user should be notified of the request status
         */
        NotificationRepository(NotificationDataSource()).sendTokenNotification(
          await _getFCMToken(request.user.id!),
          notification: Notification(
            body: "enjoy with our event",
            title: request.eventName,
          ),
        );
        emit(RequestEventApproved());
      }
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }

  void filteredRequests({RequestStatus filter = RequestStatus.waiting}) {
    emit(_requests.isEmpty
        ? EventRequestEmpty()
        : EventRequestsLoaded(
            _requests.where((req) => req.status == filter).toList()));
  }

  @override
  Future<void> close() {
    _eventsSubscription.cancel();
    return super.close();
  }

  Future<String> _getFCMToken(String id) async {
    try {
      return await NotificationRepository(NotificationDataSource())
          .getFCMToken(id);
    } catch (e) {
      rethrow;
    }
  }

  void _updateRequestStatus(String requestId, RequestStatus newStatus) {
    int index = _requests.indexWhere((req) => req.id == requestId);
    if (index != -1) {
      _requests[index] = _requests[index].copyWith(status: newStatus);
    }
  }
}
