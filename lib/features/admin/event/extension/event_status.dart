// event_status.dart
import 'package:eventra/features/admin/event/model/base_event.dart';

extension EventStatus on BaseEvent {
  /// Returns true if the event's start is in the future.
  bool get isUpcoming =>
      schedule.start.isAfter(DateTime.now()) &&
      schedule.end.isAfter(DateTime.now()); // todo check jimmy low event mn 11:00 AM - 9:00PM (Wna delw2ti sa3a 5:00PM hykon tb3 upcoming wlla past)

  /// Returns true if the event's end is in the past.
  bool get isPast => schedule.end.isBefore(DateTime.now());
}
