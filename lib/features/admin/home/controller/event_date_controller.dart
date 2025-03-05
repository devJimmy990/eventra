import 'package:flutter/material.dart';
import 'package:eventra/features/admin/event/model/event.dart';

class EventDateController extends ChangeNotifier {
  EventSchedule _value;

  EventDateController(EventSchedule? event)
      : _value = event ??
            EventSchedule(
              date: DateTime.now().toIso8601String(),
              start: DateTime.now().toIso8601String(),
              end: DateTime.now()
                  .add(const Duration(hours: 1))
                  .toIso8601String(),
            );

  set update(List<DateTime>? newValue) {
    if (newValue != null && newValue.length == 2) {
      _value = EventSchedule(
        date: newValue[0].toIso8601String(),
        start: newValue[0].toIso8601String(),
        end: newValue[1].toIso8601String(),
      );
      notifyListeners();
    }
  }

  EventSchedule get value => _value;
}
