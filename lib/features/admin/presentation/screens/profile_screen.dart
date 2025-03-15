import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/core/constants/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/landing/cubit/user_state.dart';
import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:image_picker/image_picker.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  late User admin;
  File? _pickedImage;
  late Localization strings;
  @override
  void initState() {
    super.initState();
    strings = Localization();
    admin = context.read<UserCubit>().user!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is UserImageUploaded) {
                  context
                      .read<UserCubit>()
                      .updateUserProfile(data: {"avatar": state.url});
                } else if (state is UserLoaded) {
                  Fluttertoast.showToast(
                    textColor: Colors.white,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    toastLength: Toast.LENGTH_LONG,
                    msg: Localization.profileDataUpdated,
                  );
                  setState(() => _pickedImage = null);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage: _pickedImage != null
                            ? FileImage(_pickedImage!)
                            : admin.avatar != null
                                ? NetworkImage(admin.avatar!)
                                : null,
                        child: admin.avatar == null
                            ? Text(
                                admin.name.abbreviate(),
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            : null,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Center(
                      child: _pickedImage != null
                          ? Text(Localization.profileAvatarSaving)
                          : TextButton(
                              onPressed: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((image) async {
                                  if (image != null) {
                                    setState(() {
                                      _pickedImage = File(image.path);
                                      context
                                          .read<UserCubit>()
                                          .uploadImage(_pickedImage!);
                                    });
                                  }
                                });
                              },
                              child: Text(
                                admin.avatar != null
                                    ? Localization.adminProfileAvatarChange
                                    : Localization.adminProfileAvatarUpload,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
            Divider(),
            _buildSectionTitle(Localization.profileInfo),
            _buildInfoTile(Localization.profileInfoName, admin.name),
            _buildInfoTile(Localization.profileInfoEmail, admin.email),
            _buildInfoTile(Localization.profileInfoPhone, admin.phone),
            Divider(),
            _buildSectionTitle(Localization.profileSettings),
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                bool isDark = context.read<SettingsCubit>().isDarkTheme;
                return SwitchListTile(
                  secondary: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                  title: Text(
                      "${Localization.themeSwitch} ${isDark ? Localization.themeLight : Localization.themeDark}"),
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
                        ? Localization.languageArabic
                        : Localization.languageEnglish,
                  ),
                  trailing: InkWell(
                    onTap: () => context.read<SettingsCubit>().toggleLanguage(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Localization.languageSwitch),
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
      bottomNavigationBar:
          BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            context.goNamed(Routes.auth);
          }
        },
        child: Padding(
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
                Localization.authBtnSignOut,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
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
