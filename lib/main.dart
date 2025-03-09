import 'package:flutter/material.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eventra/core/routes/go_router.dart';
import 'package:eventra/core/firebase/firebase_options.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';
import 'package:eventra/features/user/profile/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/landing/data/data_source/user_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreference.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<UserCubit>(
              create: (context) => UserCubit(),
            ),
            BlocProvider<SettingsCubit>(
              create: (context) => SettingsCubit(),
            ),
            BlocProvider<AuthenticationCubit>(
              create: (context) => AuthenticationCubit(),
            ),
            BlocProvider(
              create: (context) => ProfileCubit(UserDataSource()),
            ),
          ],
          child: Builder(
            builder: (context) {
              return BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: [
                      S.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale: Locale(state.locale),
                    routerConfig: router,
                    theme: state.theme,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
