import 'package:flutter/material.dart';

class SettingsState {}

class SettingsLoadedState extends SettingsState {
  final ThemeData theme;
  final String locale;
  SettingsLoadedState({required this.theme, required this.locale});
}
