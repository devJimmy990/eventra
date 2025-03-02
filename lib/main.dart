import 'package:flutter/material.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eventra/core/firebase/firebase_options.dart';
import 'package:eventra/core/shared_preference.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/firebase/provider.dart';
import 'core/style/app_theme.dart';
import 'features/authentication/sign_in/presentation/pages/sign_in_view.dart';
import 'features/authentication/sign_up/presentation/pages/sign_up_view.dart';
import 'features/home/presentation/pages/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreference.initialize();

  print("🔥 Firebase initialized successfully!");

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
      builder: (context , child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: child,
          routes: {
            SignUpPage.routeName:(_)=> SignUpPage(),
            SignInPage.routeName:(_)=>  SignInPage(),
            HomeView.routeName:(_)=>  HomeView()},
          theme: AppTheme.lightTheme,
        );
      },
      child: SignInPage(),
    );
  }
}