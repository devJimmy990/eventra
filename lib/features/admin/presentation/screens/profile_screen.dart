import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/core/constants/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Localization strings = Localization(context);
    final User admin = context.read<UserCubit>().user!;

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            context.goNamed(Routes.auth);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage:
                      admin.avatar != null ? NetworkImage(admin.avatar!) : null,
                  child: admin.avatar == null
                      ? Text(
                          admin.name.abbreviate(),
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.bold),
                        )
                      : null,
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    admin.avatar != null
                        ? strings.adminProfileAvatarChange
                        : strings.adminProfileAvatarUpload,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ),
              Divider(),
              _buildSectionTitle(strings.adminProfileInfo),
              _buildInfoTile(strings.adminProfileInfoName, admin.name),
              _buildInfoTile(strings.adminProfileInfoEmail, admin.email),
              _buildInfoTile(
                  strings.adminProfileInfoPhone, admin.phone ?? "01289223643"),
              Divider(),
              _buildSectionTitle(strings.adminProfileSettings),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  bool isDark = context.read<SettingsCubit>().isDarkTheme;
                  return SwitchListTile(
                    secondary:
                        Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                    title: Text(
                        "${strings.themeSwitch} ${isDark ? strings.themeLight : strings.themeDark}"),
                    value: isDark,
                    onChanged: (value) =>
                        context.read<SettingsCubit>().toggleTheme(),
                  );
                },
              ),
              BlocSelector<SettingsCubit, SettingsState, String>(
                selector: (state) => state.locale,
                builder: (context, locale) {
                  return ListTile(
                    leading: Icon(Icons.language),
                    title: Text(
                      locale == "ar"
                          ? strings.languageArabic
                          : strings.languageEnglish,
                    ),
                    trailing: InkWell(
                      onTap: () =>
                          context.read<SettingsCubit>().toggleLanguage(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(strings.languageSwitch),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FractionallySizedBox(
          widthFactor: .6,
          child: ElevatedButton(
            onPressed: () => context.read<AuthenticationCubit>().logout(),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.r),
              ),
              elevation: 5,
            ),
            child: Text(
              strings.authBtnSignOut,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return ListTile(
      leading: Text(
        label,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      ),
      title: Text(value, style: TextStyle(fontSize: 14.sp)),
    );
  }
}
