sealed class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationSubscribed extends NotificationState {}

class NotificationUnsubscribed extends NotificationState {}

class NotificationLoaded extends NotificationState {}

class NotificationReceived extends NotificationState {
  final List<String> list;
  NotificationReceived({required this.list});
}

class NotificationError extends NotificationState {
  final String error;
  NotificationError(this.error);
}
