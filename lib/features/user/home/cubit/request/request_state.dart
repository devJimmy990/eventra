import 'package:eventra/features/user/home/data/model/request_event.dart';

sealed class UserEventRequestState {}

class EventRequestInitial extends UserEventRequestState {}

class EventBooked extends UserEventRequestState {}

class EventRequestLoading extends UserEventRequestState {}

class EventRequestEmpty extends UserEventRequestState {}

class EventRequestLoaded extends UserEventRequestState {
  final RequestEvent request;
  EventRequestLoaded(this.request);
}

class EventRequestError extends UserEventRequestState {
  final String error;
  EventRequestError(this.error);
}

class EventRequestCreated extends UserEventRequestState {}
