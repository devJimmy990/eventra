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

  // skipped getter for the '_======== General ========================================================' key

  /// `Eventra`
  String get appName {
    return Intl.message(
      'Eventra',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Switch`
  String get theme_switch {
    return Intl.message(
      'Switch',
      name: 'theme_switch',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get theme_dark {
    return Intl.message(
      'Dark',
      name: 'theme_dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get theme_light {
    return Intl.message(
      'Light',
      name: 'theme_light',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get language_arabic {
    return Intl.message(
      'Arabic',
      name: 'language_arabic',
      desc: '',
      args: [],
    );
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

  // skipped getter for the '_======== Auth ========================================================' key

  /// `email`
  String get auth_input_email {
    return Intl.message(
      'email',
      name: 'auth_input_email',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get auth_input_phone {
    return Intl.message(
      'phone number',
      name: 'auth_input_phone',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get auth_input_password {
    return Intl.message(
      'password',
      name: 'auth_input_password',
      desc: '',
      args: [],
    );
  }

  /// `full name`
  String get auth_input_full_name {
    return Intl.message(
      'full name',
      name: 'auth_input_full_name',
      desc: '',
      args: [],
    );
  }

  /// `confirm password`
  String get auth_input_confirm_password {
    return Intl.message(
      'confirm password',
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
    return Intl.message(
      'Logout',
      name: 'auth_btn_logout',
      desc: '',
      args: [],
    );
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

  /// `change avatar`
  String get admin_profile_avatar_change {
    return Intl.message(
      'change avatar',
      name: 'admin_profile_avatar_change',
      desc: '',
      args: [],
    );
  }

  /// `upload avatar`
  String get admin_profile_avatar_upload {
    return Intl.message(
      'upload avatar',
      name: 'admin_profile_avatar_upload',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get admin_profile_info {
    return Intl.message(
      'Personal Information',
      name: 'admin_profile_info',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get admin_profile_info_name {
    return Intl.message(
      'Name:',
      name: 'admin_profile_info_name',
      desc: '',
      args: [],
    );
  }

  /// `Email:`
  String get admin_profile_info_email {
    return Intl.message(
      'Email:',
      name: 'admin_profile_info_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone:`
  String get admin_profile_info_phone {
    return Intl.message(
      'Phone:',
      name: 'admin_profile_info_phone',
      desc: '',
      args: [],
    );
  }

  /// `Empty Phone Number`
  String get admin_profile_info_phone_empty {
    return Intl.message(
      'Empty Phone Number',
      name: 'admin_profile_info_phone_empty',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get admin_profile_settings {
    return Intl.message(
      'Account Settings',
      name: 'admin_profile_settings',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get admin_profile_settings_language {
    return Intl.message(
      '',
      name: 'admin_profile_settings_language',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get admin_profile_settings_theme {
    return Intl.message(
      '',
      name: 'admin_profile_settings_theme',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End Admin ========================================================' key

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Events`
  String get upComingEvents {
    return Intl.message(
      'Upcoming Events',
      name: 'upComingEvents',
      desc: '',
      args: [],
    );
  }

  /// `See More..`
  String get seeMore {
    return Intl.message(
      'See More..',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `No Upcoming Events`
  String get noUpcomingEvents {
    return Intl.message(
      'No Upcoming Events',
      name: 'noUpcomingEvents',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Admin`
  String get welcomeAdmin {
    return Intl.message(
      'Welcome Admin',
      name: 'welcomeAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Event Details`
  String get eventDetails {
    return Intl.message(
      'Event Details',
      name: 'eventDetails',
      desc: '',
      args: [],
    );
  }

  /// `About Event`
  String get aboutEvent {
    return Intl.message(
      'About Event',
      name: 'aboutEvent',
      desc: '',
      args: [],
    );
  }

  /// `Attendees`
  String get attendees {
    return Intl.message(
      'Attendees',
      name: 'attendees',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `No attendees present`
  String get noAttendeesPresent {
    return Intl.message(
      'No attendees present',
      name: 'noAttendeesPresent',
      desc: '',
      args: [],
    );
  }

  /// `Events Request`
  String get eventsRequest {
    return Intl.message(
      'Events Request',
      name: 'eventsRequest',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get data {
    return Intl.message(
      'Data',
      name: 'data',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Create Event`
  String get createEvent {
    return Intl.message(
      'Create Event',
      name: 'createEvent',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get noDataAvailable {
    return Intl.message(
      'No data available',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Event Deleted Successfully`
  String get eventDeletedSuccessfully {
    return Intl.message(
      'Event Deleted Successfully',
      name: 'eventDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Don't have An Account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have An Account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Notification Screen`
  String get notificationScreen {
    return Intl.message(
      'Notification Screen',
      name: 'notificationScreen',
      desc: '',
      args: [],
    );
  }

  /// `Event Calendar`
  String get eventCalendar {
    return Intl.message(
      'Event Calendar',
      name: 'eventCalendar',
      desc: '',
      args: [],
    );
  }

  /// `No events available`
  String get noEventsAvailable {
    return Intl.message(
      'No events available',
      name: 'noEventsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark`
  String get bookmark {
    return Intl.message(
      'Bookmark',
      name: 'bookmark',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message(
      'Book Now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `Buy Ticket`
  String get buyTicket {
    return Intl.message(
      'Buy Ticket',
      name: 'buyTicket',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Call us`
  String get callUs {
    return Intl.message(
      'Call us',
      name: 'callUs',
      desc: '',
      args: [],
    );
  }

  /// `Email us`
  String get emailUs {
    return Intl.message(
      'Email us',
      name: 'emailUs',
      desc: '',
      args: [],
    );
  }

  /// `ACC Address:`
  String get accAddress {
    return Intl.message(
      'ACC Address:',
      name: 'accAddress',
      desc: '',
      args: [],
    );
  }

  /// `U.S. Embassy Cairo, 5 Tawfik Diab Street, Garden City.`
  String get accAddressDetails {
    return Intl.message(
      'U.S. Embassy Cairo, 5 Tawfik Diab Street, Garden City.',
      name: 'accAddressDetails',
      desc: '',
      args: [],
    );
  }

  /// `Opening Hours:`
  String get openingHours {
    return Intl.message(
      'Opening Hours:',
      name: 'openingHours',
      desc: '',
      args: [],
    );
  }

  /// `Monday - Thursday, 10:00 AM - 3:00 PM, Closed U.S. and Egyptian holidays.`
  String get openingHoursDetails {
    return Intl.message(
      'Monday - Thursday, 10:00 AM - 3:00 PM, Closed U.S. and Egyptian holidays.',
      name: 'openingHoursDetails',
      desc: '',
      args: [],
    );
  }

  /// `Free Membership`
  String get freeMembership {
    return Intl.message(
      'Free Membership',
      name: 'freeMembership',
      desc: '',
      args: [],
    );
  }

  /// `Join us now and get a free membership for 3 months.`
  String get freeMembershipDetails {
    return Intl.message(
      'Join us now and get a free membership for 3 months.',
      name: 'freeMembershipDetails',
      desc: '',
      args: [],
    );
  }

  /// `Special Announcements`
  String get specialAnnouncements {
    return Intl.message(
      'Special Announcements',
      name: 'specialAnnouncements',
      desc: '',
      args: [],
    );
  }

  /// `Stay tuned for our special announcements.`
  String get specialAnnouncementsDetails {
    return Intl.message(
      'Stay tuned for our special announcements.',
      name: 'specialAnnouncementsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Further Inquiries`
  String get furtherInquiries {
    return Intl.message(
      'Further Inquiries',
      name: 'furtherInquiries',
      desc: '',
      args: [],
    );
  }

  /// `ACCairo@state.gov`
  String get furtherInquiriesDetails {
    return Intl.message(
      'ACCairo@state.gov',
      name: 'furtherInquiriesDetails',
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

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Please add an event`
  String get pleaseAddAnEvent {
    return Intl.message(
      'Please add an event',
      name: 'pleaseAddAnEvent',
      desc: '',
      args: [],
    );
  }

  /// `Event will be held in embassy`
  String get eventWillBeHeldInEmbassy {
    return Intl.message(
      'Event will be held in embassy',
      name: 'eventWillBeHeldInEmbassy',
      desc: '',
      args: [],
    );
  }

  /// `Event will be held in other`
  String get eventWillBeHeldInOther {
    return Intl.message(
      'Event will be held in other',
      name: 'eventWillBeHeldInOther',
      desc: '',
      args: [],
    );
  }

  /// `Area Name`
  String get areaName {
    return Intl.message(
      'Area Name',
      name: 'areaName',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Google Map URL`
  String get googleMapUrl {
    return Intl.message(
      'Google Map URL',
      name: 'googleMapUrl',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
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
