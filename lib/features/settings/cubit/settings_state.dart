import 'package:flutter/material.dart';

class SettingsState {
  final ThemeData theme;
  final String locale;

  const SettingsState({required this.theme, required this.locale});

  SettingsState copyWith({ThemeData? theme, String? locale}) {
    return SettingsState(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }
}