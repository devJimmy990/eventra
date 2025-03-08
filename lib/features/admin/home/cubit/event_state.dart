part of 'event_cubit.dart';

sealed class EventState {}

class EventInitial extends EventState {
  EventInitial();
}

class EventLoading extends EventState {
  EventLoading();
}

class EventAdded extends EventState {}

class EventLoaded extends EventState {
  final List<AdminEvent> events;
  EventLoaded(this.events);
}

class EventError extends EventState {
  final String message;
  EventError({required this.message});
}

class EventEmpty extends EventState {}

class ImageUploading extends EventState {}

class ImageUploaded extends EventState {
  final String url;
  ImageUploaded(this.url);
}
