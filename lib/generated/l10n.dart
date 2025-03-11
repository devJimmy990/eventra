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

  /// `Eventra`
  String get appName {
    return Intl.message('Eventra', name: 'appName', desc: '', args: []);
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Full name`
  String get fullName {
    return Intl.message('Full name', name: 'fullName', desc: '', args: []);
  }

  /// `Example@email.com`
  String get emailEx {
    return Intl.message(
      'Example@email.com',
      name: 'emailEx',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get yourPass {
    return Intl.message('Your password', name: 'yourPass', desc: '', args: []);
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
    return Intl.message('OR', name: 'or', desc: '', args: []);
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
    return Intl.message('See More..', name: 'seeMore', desc: '', args: []);
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
    return Intl.message('Events', name: 'events', desc: '', args: []);
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
    return Intl.message('Upcoming', name: 'upcoming', desc: '', args: []);
  }

  /// `Previous`
  String get previous {
    return Intl.message('Previous', name: 'previous', desc: '', args: []);
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
    return Intl.message('About Event', name: 'aboutEvent', desc: '', args: []);
  }

  /// `Attendees`
  String get attendees {
    return Intl.message('Attendees', name: 'attendees', desc: '', args: []);
  }

  /// `See all`
  String get seeAll {
    return Intl.message('See all', name: 'seeAll', desc: '', args: []);
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
    return Intl.message('Data', name: 'data', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
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
    return Intl.message('Create', name: 'create', desc: '', args: []);
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
    return Intl.message('Bookmark', name: 'bookmark', desc: '', args: []);
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message('Book Now', name: 'bookNow', desc: '', args: []);
  }

  /// `Buy Ticket`
  String get buyTicket {
    return Intl.message('Buy Ticket', name: 'buyTicket', desc: '', args: []);
  }

  /// `Explore`
  String get explore {
    return Intl.message('Explore', name: 'explore', desc: '', args: []);
  }

  /// `Calendar`
  String get calendar {
    return Intl.message('Calendar', name: 'calendar', desc: '', args: []);
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Call us`
  String get callUs {
    return Intl.message('Call us', name: 'callUs', desc: '', args: []);
  }

  /// `Email us`
  String get emailUs {
    return Intl.message('Email us', name: 'emailUs', desc: '', args: []);
  }

  /// `ACC Address:`
  String get accAddress {
    return Intl.message('ACC Address:', name: 'accAddress', desc: '', args: []);
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
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
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
    return Intl.message('Login', name: 'login', desc: '', args: []);
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
    return Intl.message('Area Name', name: 'areaName', desc: '', args: []);
  }

  /// `Required`
  String get required {
    return Intl.message('Required', name: 'required', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
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
    return Intl.message('English', name: 'english', desc: '', args: []);
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
