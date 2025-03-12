import 'package:eventra/features/user/home/data/model/request_event.dart';

sealed class AdminEventRequestState {}

class EventRequestInitial extends AdminEventRequestState {}

class EventRequestLoading extends AdminEventRequestState {}
class EventRequestEmpty extends AdminEventRequestState {}

class EventRequestsLoaded extends AdminEventRequestState {
  final List<RequestEvent> requests;
  EventRequestsLoaded(this.requests);
}

class EventRequestError extends AdminEventRequestState {
  final String error;
  EventRequestError(this.error);
}
