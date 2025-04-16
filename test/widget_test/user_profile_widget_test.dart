import 'dart:io';
import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/user/profile/profile_screen.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/landing/cubit/user_state.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// fake user data to run test for profile widgets
class DummyUserCubit extends HydratedCubit<UserState> implements UserCubit {
  DummyUserCubit()
      : super(UserLoaded(
          User.register(
            id: '1',
            name: 'Test User',
            email: 'test@example.com',
            phone: '1234567890',
          ),
        ));

  @override
  User? get user => (state as UserLoaded).user;

  @override
  Future<void> updateUserProfile({required Map<String, String> data}) async {}

  @override
  Future<void> uploadImage(File image) async {}

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Future<void> reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }

  @override
  void setUser(Map<String, dynamic> user) {
    // TODO: implement setUser
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class DummySettingsCubit extends Cubit<SettingsState> implements SettingsCubit {
  DummySettingsCubit()
      : super(SettingsLoadedState(locale: 'en', theme: ThemeData.light()));

  @override
  bool get isDarkTheme => false;

  @override
  String get locale => 'en';

  @override
  void toggleTheme() {}

  @override
  void toggleLanguage() {}
}

void main() {
  testWidgets('ProfileScreen renders and displays Test User',
      (WidgetTester tester) async {
    final dummyUserCubit = DummyUserCubit();
    final dummySettingsCubit = DummySettingsCubit();

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: MultiBlocProvider(
              providers: [
                BlocProvider<SettingsCubit>(create: (_) => dummySettingsCubit),
                BlocProvider<UserCubit>(create: (_) => dummyUserCubit),
              ],
              child: const UserProfileScreen(),
            ),
          );
        },
      ),
    );

    await tester.pumpAndSettle();

    // Check if the AppBar title is the localized user profile title.
    expect(find.text(Localization.userProfile), findsOneWidget);

    // Check if the dummy user's name "Test User" appears.
    expect(find.text('Test User'), findsOneWidget);
  });
}
