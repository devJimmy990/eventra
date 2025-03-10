import 'package:eventra/features/user/home/data/model/booked_event.dart';

sealed class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarkEmpty extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  final List<UserEvent> events;
  BookmarkLoaded(this.events);
}

class BookmarkError extends BookmarkState {
  final String error;
  BookmarkError(this.error);
}
