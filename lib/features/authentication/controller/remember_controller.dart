import 'package:flutter/material.dart';

class RememberController extends ChangeNotifier {
  bool _remember = false;

  bool get value => _remember;

  set value(bool? value) {
    _remember = value ?? false;
    notifyListeners();
  }
}
