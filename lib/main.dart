import 'package:eventra/core/helper/connection.dart';
import 'package:eventra/features/admin/cubit/requests/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:eventra/generated/l10n.dart';
import 'package:eventra/core/routes/go_router.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/core/firebase/firebase_options.dart';
import 'package:eventra/core/helper/notification_service.dart';

import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/user/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/cubit/event/event_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_cubit.dart';
import 'package:eventra/features/notification/cubit/notification_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreference.initialize();
  await NotificationService.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) Connection.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => BookmarkCubit()),
            BlocProvider(create: (context) => UserEventCubit()),
            BlocProvider(create: (context) => AdminEventCubit()),
            BlocProvider(create: (context) => NotificationCubit()),
            BlocProvider<UserCubit>(create: (context) => UserCubit()),
            BlocProvider(create: (context) => AdminEventRequestCubit()),
            BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
            BlocProvider<AuthenticationCubit>(
                create: (context) => AuthenticationCubit()),
          ],
          child: Builder(
            builder: (context) {
              return BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  if (state is SettingsLoadedState) {
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
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        );
      },
    );
  }
}
