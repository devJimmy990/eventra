// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Eventra`
  String get appName {
    return Intl.message(
      'Eventra',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `abc@email.com`
  String get emailEx {
    return Intl.message(
      'abc@email.com',
      name: 'emailEx',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get yourPass {
    return Intl.message(
      'Your password',
      name: 'yourPass',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPass {
    return Intl.message(
      'Confirm password',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberPass {
    return Intl.message(
      'Remember me',
      name: 'rememberPass',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPass {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noAcc {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAcc',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get hasAcc {
    return Intl.message(
      'Already have an account?',
      name: 'hasAcc',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty`
  String get empty {
    return Intl.message(
      'This field cannot be empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid Email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid Email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrongPass {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrongPass',
      desc: '',
      args: [],
    );
  }

  /// `Passwords doesn't match`
  String get passNotMatch {
    return Intl.message(
      'Passwords doesn\'t match',
      name: 'passNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get accCreated {
    return Intl.message(
      'Account created successfully',
      name: 'accCreated',
      desc: '',
      args: [],
    );
  }

  /// `Please enter at least 6 characters`
  String get shortPass {
    return Intl.message(
      'Please enter at least 6 characters',
      name: 'shortPass',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get usedEmail {
    return Intl.message(
      'The account already exists for that email.',
      name: 'usedEmail',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get noUser {
    return Intl.message(
      'No user found for that email.',
      name: 'noUser',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get SignInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'SignInWithGoogle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
