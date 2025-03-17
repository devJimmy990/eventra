import 'package:eventra/features/admin/data/model/admin_event.dart';

sealed class AdminEventState {}

class EventInitial extends AdminEventState {
  EventInitial();
}

class EventLoading extends AdminEventState {
  EventLoading();
}

class EventAdded extends AdminEventState {}

class EventLoaded extends AdminEventState {
  final List<AdminEvent> events;
  final String? msg;
  EventLoaded(this.events, {this.msg});
}

class EventError extends AdminEventState {
  final String message;
  EventError({required this.message});
}

class EventEmpty extends AdminEventState {}

class ImageUploading extends AdminEventState {}

class ImageUploaded extends AdminEventState {
  final String url;
  ImageUploaded(this.url);
}

class EventDeleted extends AdminEventState {
  final List<AdminEvent> events;
  EventDeleted(this.events);
}
