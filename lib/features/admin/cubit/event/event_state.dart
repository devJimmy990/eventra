import 'package:eventra/features/admin/cubit/event/event_cubit.dart';
import 'package:eventra/features/admin/data/model/admin_event.dart';

sealed class AdminEventState {}

class EventInitial extends AdminEventState {}

class EventLoading extends AdminEventState {}

class EventEmpty extends AdminEventState {}

class EventLoaded extends AdminEventState {
  final EventAction? action;
  final List<AdminEvent> events;
  EventLoaded(this.events, {this.action});
}

class EventError extends AdminEventState {
  final String message;
  EventError({required this.message});
}

class ImageUploading extends AdminEventState {}

class ImageUploaded extends AdminEventState {
  final String url;
  ImageUploaded(this.url);
}
