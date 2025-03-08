import 'package:flutter/material.dart';

class DateController extends ChangeNotifier {
  DateTime _value = DateTime.now();
  DateTime get value => _value;

  set value(DateTime? value) {
    if (value != null) {
      _value = value;
      notifyListeners();
    }
  }
}
