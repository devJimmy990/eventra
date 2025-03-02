import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/theme/theme_data.dart';
import 'package:eventra/core/shared_preference.dart';
import 'package:eventra/core/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool isDark = false;
  final AppThemeData _appThemeData = AppThemeData();

  ThemeCubit() : super(InitThemeState());

  void loadTheme() async {
    emit(ThemeLoading());
    try {
      final theme = SharedPreference.getString(key: "theme");
      isDark = theme == "dark";
      emit(ThemeLoaded(theme: currentTheme));
    } catch (e) {
      emit(ThemeError(error: e.toString()));
    }
  }

  void toggleTheme() async {
    emit(ThemeLoading());
    try {
      isDark = !isDark;
      await SharedPreference.setString(
          key: "theme", value: isDark ? "dark" : "light");
      emit(ToggleThemeState(theme: currentTheme));
    } catch (e) {
      emit(ThemeError(error: e.toString()));
    }
  }

  ThemeData get currentTheme =>
      isDark ? _appThemeData.darkThemeData : _appThemeData.lightThemeData;
}
