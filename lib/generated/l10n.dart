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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  // skipped getter for the '_======== General ========================================================' key

  /// `Eventra`
  String get appName {
    return Intl.message('Eventra', name: 'appName', desc: '', args: []);
  }

  /// `Switch`
  String get theme_switch {
    return Intl.message('Switch', name: 'theme_switch', desc: '', args: []);
  }

  /// `Dark`
  String get theme_dark {
    return Intl.message('Dark', name: 'theme_dark', desc: '', args: []);
  }

  /// `Light`
  String get theme_light {
    return Intl.message('Light', name: 'theme_light', desc: '', args: []);
  }

  /// `Arabic`
  String get language_arabic {
    return Intl.message('Arabic', name: 'language_arabic', desc: '', args: []);
  }

  /// `English`
  String get language_english {
    return Intl.message(
      'English',
      name: 'language_english',
      desc: '',
      args: [],
    );
  }

  /// `تغيير للغة العربية`
  String get language_switch {
    return Intl.message(
      'تغيير للغة العربية',
      name: 'language_switch',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get dialog_ok {
    return Intl.message('Ok', name: 'dialog_ok', desc: '', args: []);
  }

  /// `Cancel`
  String get dialog_cancel {
    return Intl.message('Cancel', name: 'dialog_cancel', desc: '', args: []);
  }

  /// `Delete`
  String get dialog_delete {
    return Intl.message('Delete', name: 'dialog_delete', desc: '', args: []);
  }

  /// `Confirm Delete`
  String get dialog_confirm_delete {
    return Intl.message(
      'Confirm Delete',
      name: 'dialog_confirm_delete',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get snackbar_undo {
    return Intl.message('Undo', name: 'snackbar_undo', desc: '', args: []);
  }

  // skipped getter for the '_========  End General ========================================================' key

  // skipped getter for the '_======== Validator ========================================================' key

  /// `required`
  String get validator_empty {
    return Intl.message(
      'required',
      name: 'validator_empty',
      desc: '',
      args: [],
    );
  }

  /// `Name is too short`
  String get validator_short_message {
    return Intl.message(
      'Name is too short',
      name: 'validator_short_message',
      desc: '',
      args: [],
    );
  }

  /// `Name is too short`
  String get validator_short_name {
    return Intl.message(
      'Name is too short',
      name: 'validator_short_name',
      desc: '',
      args: [],
    );
  }

  /// `Name must be less than 25 characters`
  String get validator_long_name {
    return Intl.message(
      'Name must be less than 25 characters',
      name: 'validator_long_name',
      desc: '',
      args: [],
    );
  }

  /// `invalid phone number format e.g. 0128223643`
  String get validator_invalid_phone {
    return Intl.message(
      'invalid phone number format e.g. 0128223643',
      name: 'validator_invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `invalid email format e.g. abc@email.com`
  String get validator_invalid_email {
    return Intl.message(
      'invalid email format e.g. abc@email.com',
      name: 'validator_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be more than 6 characters`
  String get validator_short_password {
    return Intl.message(
      'Password must be more than 6 characters',
      name: 'validator_short_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get validator_password_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'validator_password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `invalid email or password`
  String get validator_firebase_invalid_credentials {
    return Intl.message(
      'invalid email or password',
      name: 'validator_firebase_invalid_credentials',
      desc: '',
      args: [],
    );
  }

  /// `password is too weak`
  String get validator_firebase_weak_password {
    return Intl.message(
      'password is too weak',
      name: 'validator_firebase_weak_password',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email`
  String get validator_firebase_used_email {
    return Intl.message(
      'The account already exists for that email',
      name: 'validator_firebase_used_email',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End Validator ========================================================' key

  // skipped getter for the '_======== Profile ========================================================' key

  /// `User updated successfully`
  String get profile_data_updated {
    return Intl.message(
      'User updated successfully',
      name: 'profile_data_updated',
      desc: '',
      args: [],
    );
  }

  /// `avatar is uploading...`
  String get profile_avatar_save {
    return Intl.message(
      'avatar is uploading...',
      name: 'profile_avatar_save',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get profile_save_changes {
    return Intl.message(
      'Save Changes',
      name: 'profile_save_changes',
      desc: '',
      args: [],
    );
  }

  /// `change avatar`
  String get profile_avatar_change {
    return Intl.message(
      'change avatar',
      name: 'profile_avatar_change',
      desc: '',
      args: [],
    );
  }

  /// `upload avatar`
  String get profile_avatar_upload {
    return Intl.message(
      'upload avatar',
      name: 'profile_avatar_upload',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get profile_info {
    return Intl.message(
      'Personal Information',
      name: 'profile_info',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get profile_info_name {
    return Intl.message('Name:', name: 'profile_info_name', desc: '', args: []);
  }

  /// `Email:`
  String get profile_info_email {
    return Intl.message(
      'Email:',
      name: 'profile_info_email',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get profile_info_interests {
    return Intl.message(
      'Interests',
      name: 'profile_info_interests',
      desc: '',
      args: [],
    );
  }

  /// `Phone:`
  String get profile_info_phone {
    return Intl.message(
      'Phone:',
      name: 'profile_info_phone',
      desc: '',
      args: [],
    );
  }

  /// `Empty Phone Number`
  String get profile_info_phone_empty {
    return Intl.message(
      'Empty Phone Number',
      name: 'profile_info_phone_empty',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get profile_settings {
    return Intl.message(
      'Account Settings',
      name: 'profile_settings',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get profile_settings_language {
    return Intl.message(
      '',
      name: 'profile_settings_language',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get profile_settings_theme {
    return Intl.message('', name: 'profile_settings_theme', desc: '', args: []);
  }

  // skipped getter for the '_========  End Profile ========================================================' key

  // skipped getter for the '_======== Auth ========================================================' key

  /// `E-Mail`
  String get auth_input_email {
    return Intl.message('E-Mail', name: 'auth_input_email', desc: '', args: []);
  }

  /// `Phone Number`
  String get auth_input_phone {
    return Intl.message(
      'Phone Number',
      name: 'auth_input_phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get auth_input_password {
    return Intl.message(
      'Password',
      name: 'auth_input_password',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get auth_input_full_name {
    return Intl.message(
      'Full Name',
      name: 'auth_input_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get auth_input_confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'auth_input_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get auth_btn_sign_in {
    return Intl.message(
      'Sign in',
      name: 'auth_btn_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get auth_btn_sign_up {
    return Intl.message(
      'Sign up',
      name: 'auth_btn_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get auth_btn_logout {
    return Intl.message('Logout', name: 'auth_btn_logout', desc: '', args: []);
  }

  /// `Forget Password?`
  String get auth_btn_forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'auth_btn_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in With Google`
  String get auth_btn_sign_in_google {
    return Intl.message(
      'Sign in With Google',
      name: 'auth_btn_sign_in_google',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get auth_tab_sign_in {
    return Intl.message(
      'Sign in',
      name: 'auth_tab_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get auth_tab_sign_up {
    return Intl.message(
      'Sign up',
      name: 'auth_tab_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get auth_toggle_remember_me {
    return Intl.message(
      'Remember Me',
      name: 'auth_toggle_remember_me',
      desc: '',
      args: [],
    );
  }

  /// `need to login every time open the app`
  String get auth_remember_msg {
    return Intl.message(
      'need to login every time open the app',
      name: 'auth_remember_msg',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End Auth ========================================================' key

  // skipped getter for the '_======== Admin ========================================================' key

  /// `Welcome Admin`
  String get admin_app_bar_title {
    return Intl.message(
      'Welcome Admin',
      name: 'admin_app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get admin_explore_tab_up_coming {
    return Intl.message(
      'Upcoming',
      name: 'admin_explore_tab_up_coming',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get admin_explore_tab_previous {
    return Intl.message(
      'Previous',
      name: 'admin_explore_tab_previous',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End Admin ========================================================' key

  // skipped getter for the '_======== User ========================================================' key

  /// `Show QR Code`
  String get user_event_details_qr {
    return Intl.message(
      'Show QR Code',
      name: 'user_event_details_qr',
      desc: '',
      args: [],
    );
  }

  /// `Request is in Waiting State`
  String get user_event_details_wait {
    return Intl.message(
      'Request is in Waiting State',
      name: 'user_event_details_wait',
      desc: '',
      args: [],
    );
  }

  /// `Request is Rejected`
  String get user_event_details_reject {
    return Intl.message(
      'Request is Rejected',
      name: 'user_event_details_reject',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this Event from bookmark?`
  String get user_bookmark_deleting_msg {
    return Intl.message(
      'Are you sure you want to remove this Event from bookmark?',
      name: 'user_bookmark_deleting_msg',
      desc: '',
      args: [],
    );
  }

  /// `Event removed from favorites`
  String get user_bookmark_deleted_msg {
    return Intl.message(
      'Event removed from favorites',
      name: 'user_bookmark_deleted_msg',
      desc: '',
      args: [],
    );
  }

  /// `No events available`
  String get no_event_available {
    return Intl.message(
      'No events available',
      name: 'no_event_available',
      desc: '',
      args: [],
    );
  }

  /// `Event Calendar`
  String get event_calendar {
    return Intl.message(
      'Event Calendar',
      name: 'event_calendar',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message('Contact Us', name: 'contact_us', desc: '', args: []);
  }

  /// `Call Us`
  String get user_call_us {
    return Intl.message('Call Us', name: 'user_call_us', desc: '', args: []);
  }

  /// `Email Us`
  String get user_email_us {
    return Intl.message('Email Us', name: 'user_email_us', desc: '', args: []);
  }

  /// `Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.`
  String get contact_us_message {
    return Intl.message(
      'Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.',
      name: 'contact_us_message',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message('Facebook', name: 'facebook', desc: '', args: []);
  }

  /// `follow us on facebook`
  String get follow_us_on_facebook {
    return Intl.message(
      'follow us on facebook',
      name: 'follow_us_on_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get user_instagram {
    return Intl.message(
      'Instagram',
      name: 'user_instagram',
      desc: '',
      args: [],
    );
  }

  /// `follow us on instagram`
  String get user_follow_instagram {
    return Intl.message(
      'follow us on instagram',
      name: 'user_follow_instagram',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get user_twitter {
    return Intl.message('Twitter', name: 'user_twitter', desc: '', args: []);
  }

  /// `follow us on twitter`
  String get user_follow_twitter {
    return Intl.message(
      'follow us on twitter',
      name: 'user_follow_twitter',
      desc: '',
      args: [],
    );
  }

  /// `YouTube`
  String get userYoutube {
    return Intl.message('YouTube', name: 'userYoutube', desc: '', args: []);
  }

  /// `subscribe our channel`
  String get userSubscribeChannel {
    return Intl.message(
      'subscribe our channel',
      name: 'userSubscribeChannel',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get UserWhatsapp {
    return Intl.message('WhatsApp', name: 'UserWhatsapp', desc: '', args: []);
  }

  /// `contact us on whatsapp`
  String get userWhatsAppContact {
    return Intl.message(
      'contact us on whatsapp',
      name: 'userWhatsAppContact',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get userLocation {
    return Intl.message('Location', name: 'userLocation', desc: '', args: []);
  }

  /// `visit our location`
  String get userVisitLocation {
    return Intl.message(
      'visit our location',
      name: 'userVisitLocation',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark Events`
  String get favoriteEvents {
    return Intl.message(
      'Bookmark Events',
      name: 'favoriteEvents',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End User ========================================================' key
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
