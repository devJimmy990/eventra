import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/admin/cubit/requests/request_state.dart';
import 'package:eventra/features/admin/data/data_source/admin_events_requests_data_source.dart';
import 'package:eventra/features/admin/data/repositories/admin_events_requests_repository.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminEventRequestCubit extends Cubit<AdminEventRequestState> {
  AdminEventRequestCubit() : super(EventRequestInitial()) {
    getRequests();
  }
  final List<RequestEvent> _waitingRequests = [];
  final List<RequestEvent> _pendingRequests = [];
  final List<RequestEvent> _approvedRequests = [];
  final List<RequestEvent> _rejectedRequests = [];

  void getRequests() async {
    emit(EventRequestLoading());
    try {
      String uid = SharedPreference.getString(key: "uid")!;
      List<RequestEvent> requests =
          await AdminEventsRequestsRepository(AdminEventsRequestsDataSource())
              .getAdminEventsRequests(uid);
      _handleRequestsDate(requests);
      emit(_waitingRequests.isEmpty
          ? EventRequestEmpty()
          : EventRequestsLoaded(_waitingRequests));
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }

  Future<void> onAcceptRequest(RequestEvent request) async {
    try {
      bool data =
          await AdminEventsRequestsRepository(AdminEventsRequestsDataSource())
              .onAcceptRequest(
        id: request.id!,
        data: {"status": 2},
      );
      if (data) {
        _waitingRequests.remove(request);
        _pendingRequests.add(request);
        emit(_waitingRequests.isEmpty
            ? EventRequestEmpty()
            : EventRequestsLoaded(_waitingRequests));
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
        id: request.id!,
        data: {"status": 1},
      );
      if (data) {
        _waitingRequests.remove(request);
        _rejectedRequests.add(request);
        emit(_waitingRequests.isEmpty
            ? EventRequestEmpty()
            : EventRequestsLoaded(_waitingRequests));
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
        _waitingRequests.remove(request);
        _pendingRequests.add(request);
        emit(RequestEventApproved());
      }
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }

  void filterEvents(RequestStatus filter) {
    switch (filter) {
      case RequestStatus.waiting:
        emit(_waitingRequests.isEmpty
            ? EventRequestEmpty()
            : EventRequestsLoaded(_waitingRequests));
        break;
      case RequestStatus.pending:
        emit(_pendingRequests.isEmpty
            ? EventRequestEmpty()
            : EventRequestsLoaded(_pendingRequests));
        break;
      case RequestStatus.approved:
        emit(_approvedRequests.isEmpty
            ? EventRequestEmpty()
            : EventRequestsLoaded(_approvedRequests));
        break;
      case RequestStatus.rejected:
        emit(_rejectedRequests.isEmpty
            ? EventRequestEmpty()
            : EventRequestsLoaded(_rejectedRequests));
        break;
    }
  }

  void _handleRequestsDate(List<RequestEvent> requests) {
    for (RequestEvent request in requests) {
      if (request.status == RequestStatus.waiting) {
        _waitingRequests.add(request);
      } else if (request.status == RequestStatus.pending) {
        _pendingRequests.add(request);
      } else if (request.status == RequestStatus.approved) {
        _approvedRequests.add(request);
      } else {
        _rejectedRequests.add(request);
      }
    }
  }
}
