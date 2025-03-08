import 'package:flutter/material.dart';
import 'package:eventra/features/admin/event/model/base_event.dart';

class EventDateController extends ChangeNotifier {
  EventSchedule _value;

  EventDateController(EventSchedule? event)
      : _value = event ??
            EventSchedule(
              date: DateTime.now(),
              start: DateTime.now(),
              end: DateTime.now().add(const Duration(hours: 1)),
            );

  set update(List<DateTime>? newValue) {
    if (newValue != null && newValue.length == 2) {
      _value = EventSchedule(
        date: newValue[0],
        start: newValue[0],
        end: newValue[1],
      );
      notifyListeners();
    }
  }

  EventSchedule get value => _value;
}
