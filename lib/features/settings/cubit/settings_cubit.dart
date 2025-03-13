import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/settings/cubit/theme_data.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
          theme: AppTheme.light,
          locale: "en",
        )) {
    loadSettings();
  }

  void _loadTheme() {
    final theme = SharedPreference.getString(key: "theme");
    emit(state.copyWith(
      theme: theme == "dark" ? AppTheme.dark : AppTheme.light,
    ));
  }

  void _loadLanguage() async {
    final locale = SharedPreference.getString(key: "locale");
    emit(state.copyWith(locale: locale ?? "en"));
  }

  void toggleTheme() {
    SharedPreference.setString(
      key: "theme",
      value: state.theme == AppTheme.dark ? "light" : "dark",
    );
    emit(state.copyWith(
      theme: state.theme == AppTheme.dark ? AppTheme.light : AppTheme.dark,
    ));
  }

  void toggleLanguage() {
    SharedPreference.setString(
      key: "locale",
      value: state.locale == "en" ? "ar" : "en",
    );
    emit(state.copyWith(
      locale: state.locale == "en" ? "ar" : "en",
    ));
  }

  void loadSettings() {
    _loadTheme();
    _loadLanguage();
  }

  bool get isDarkTheme => state.theme == AppTheme.dark;
}
