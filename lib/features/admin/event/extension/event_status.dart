import 'package:eventra/features/admin/event/model/base_event.dart';

extension EventStatus on BaseEvent {
  /// Returns true if the event's start is in the future.
  bool get isUpcoming => schedule.start.isAfter(DateTime.now());

  /// Returns true if the event's end is in the past.
  bool get isPast => schedule.end.isBefore(DateTime.now());

  /// Returns true if the event is currently ongoing.
  bool get isOngoing =>
      schedule.start.isBefore(DateTime.now()) &&
      schedule.end.isAfter(DateTime.now());
}
