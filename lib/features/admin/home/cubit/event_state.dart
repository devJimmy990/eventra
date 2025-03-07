part of 'event_cubit.dart';

sealed class EventState {}

class EventInitial extends EventState {
  EventInitial();
}

class EventLoading extends EventState {
  EventLoading();
}

class EventLoaded extends EventState {
  final List<AdminEvent> events;
  EventLoaded({required this.events});
}

class EventError extends EventState {
  final String message;
  EventError({required this.message});
}

class EventEmpty extends EventState {

  EventEmpty();
}
