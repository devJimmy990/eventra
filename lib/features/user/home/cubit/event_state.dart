import 'package:eventra/features/user/event/data/models/booked_event.dart';

sealed class UserEventState {}

class EventInitial extends UserEventState {}

class EventLoading extends UserEventState {}

class EventLoaded extends UserEventState {
  final List<UserEvent> events;
  EventLoaded(this.events);
}

class EventError extends UserEventState {
  final String error;
  EventError(this.error);
}

class EventEmpty extends UserEventState {}
