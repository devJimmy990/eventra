sealed class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {}

class NotificationEmpty extends NotificationState {}

class NotificationError extends NotificationState {
  final String error;
  NotificationError(this.error);
}
