import 'package:eventra/features/user/home/data/model/booked_event.dart';

sealed class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<UserEvent> events;
  EventLoaded(this.events);
}

class EventError extends EventState {
  final String error;
  EventError(this.error);
}

class EventEmpty extends EventState {}

class EventBooked extends EventState {}
