import 'package:eventra/core/shared_preference.dart';
import 'package:eventra/core/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool isDark = false;

  ThemeCubit() : super(InitThemeState());

  void loadTheme() {
    emit(ThemeLoading());
    try {
      String? theme = SharedPreference.getString(key: "theme");
      isDark = theme == "dark";
      emit(ThemeLoaded(theme: currentTheme));
    } catch (e) {
      emit(ThemeError(error: e.toString()));
    }
  }

  void toggleTheme() {
    emit(ThemeLoading());
    try {
      isDark = !isDark;
      emit(ToggleThemeState(theme: currentTheme));
    } catch (e) {
      emit(ThemeError(error: e.toString()));
    }
  }

  ThemeData get currentTheme => isDark ? ThemeData.dark() : ThemeData.light();
}
