import 'package:eventra/core/firebase/firebase_options.dart';
import 'package:eventra/core/routes/go_router.dart';
import 'package:eventra/core/theme/theme_cubit.dart';
import 'package:eventra/core/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:eventra/core/shared_preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/firebase/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreference.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthUserProvider(),
      child: const MyApp(),
    ),
  );
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
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit()..loadTheme(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
            ThemeData themeData = ThemeData.light();

            if (state is ThemeLoaded || state is ToggleThemeState) {
              themeData = (state as dynamic).theme;
            }
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                S.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: themeData,
              routerConfig: router,
            );
          }),
        );
      },
    );
  }
}
