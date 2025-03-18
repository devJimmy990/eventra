import 'package:eventra/features/settings/cubit/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState()) {
    _loadSettings();
  }
  late String _locale;
  late ThemeData _theme;
  void _loadSettings() {
    final theme = SharedPreference.getString(key: "theme");
    _locale = SharedPreference.getString(key: "locale") ?? "en";
    _theme = theme == "dark" ? AppTheme.dark : AppTheme.light;
    emit(SettingsLoadedState(theme: _theme, locale: _locale));
  }

  void toggleTheme() {
    _theme == AppTheme.dark ? AppTheme.light : AppTheme.dark;
    SharedPreference.setString(
      key: "theme",
      value: _theme == AppTheme.dark ? "light" : "dark",
    );
    emit(SettingsLoadedState(theme: _theme, locale: _locale));
  }

  void toggleLanguage() {
    _locale = _locale == "en" ? "ar" : "en";
    SharedPreference.setString(
      key: "locale",
      value: _locale,
    );
    emit(SettingsLoadedState(theme: _theme, locale: _locale));
  }

  bool get isDarkTheme => _theme == AppTheme.dark;
  String get locale => _locale;
}
