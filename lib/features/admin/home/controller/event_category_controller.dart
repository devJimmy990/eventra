import 'package:flutter/material.dart';
import 'package:eventra/features/admin/event/model/event.dart';

class EventCategoryController extends ChangeNotifier {
  EventCategory? _value;

  EventCategory? get value => _value;

  set value(EventCategory? newValue) {
    if (newValue != null) {
      _value = newValue;
      notifyListeners();
    }
  }
}
