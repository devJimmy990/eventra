import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';
import 'package:eventra/features/user/profile/profile_about_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.userProfile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileAboutSection(),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  Localization.profileSettings,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  bool isDark = context.read<SettingsCubit>().isDarkTheme;
                  return SwitchListTile(
                    secondary:
                        Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                    title: Text(
                        "${Localization.themeSwitch} ${isDark ? Localization.themeLight : Localization.themeDark}"),
                    value: isDark,
                    onChanged: (value) =>
                        context.read<SettingsCubit>().toggleTheme(),
                  );
                },
              ),
              BlocSelector<SettingsCubit, SettingsState, String>(
                selector: (state) {
                  if (state is SettingsLoadedState) {
                    return state.locale;
                  }
                  return "en";
                },
                builder: (context, locale) {
                  return ListTile(
                    leading: Icon(Icons.language),
                    title: Text(
                      locale == "ar"
                          ? Localization.languageArabic
                          : Localization.languageEnglish,
                    ),
                    trailing: InkWell(
                      onTap: () =>
                          context.read<SettingsCubit>().toggleLanguage(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            Localization.languageSwitch,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(Icons.change_circle_outlined),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
