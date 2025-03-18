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

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirm_delete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirm_delete',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get undo {
    return Intl.message(
      'Undo',
      name: 'undo',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `approve`
  String get approve {
    return Intl.message(
      'approve',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `wait`
  String get wait {
    return Intl.message(
      'wait',
      name: 'wait',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get select_date {
    return Intl.message(
      'Select Date',
      name: 'select_date',
      desc: '',
      args: [],
    );
  }

  /// `User Profile`
  String get user_profile {
    return Intl.message(
      'User Profile',
      name: 'user_profile',
      desc: '',
      args: [],
    );
  }

  /// `Admin Profile`
  String get admin_profile {
    return Intl.message(
      'Admin Profile',
      name: 'admin_profile',
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

  /// `Name`
  String get profile_info_name {
    return Intl.message(
      'Name',
      name: 'profile_info_name',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get profile_info_email {
    return Intl.message(
      'E-Mail',
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

  /// `Select Interest`
  String get profile_info_select_interests {
    return Intl.message(
      'Select Interest',
      name: 'profile_info_select_interests',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get profile_info_phone {
    return Intl.message(
      'Phone',
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
    return Intl.message(
      '',
      name: 'profile_settings_theme',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End Profile ========================================================' key

  // skipped getter for the '_======== Auth ========================================================' key

  /// `E-Mail`
  String get auth_input_email {
    return Intl.message(
      'E-Mail',
      name: 'auth_input_email',
      desc: '',
      args: [],
    );
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

  // skipped getter for the '_======== User ========================================================' key

  /// `Events`
  String get user_home_app_bar {
    return Intl.message(
      'Events',
      name: 'user_home_app_bar',
      desc: '',
      args: [],
    );
  }

  /// `No upcoming events`
  String get user_home_upcoming_empty {
    return Intl.message(
      'No upcoming events',
      name: 'user_home_upcoming_empty',
      desc: '',
      args: [],
    );
  }

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

  /// `Bookmark Events`
  String get favoriteEvents {
    return Intl.message(
      'Bookmark Events',
      name: 'favoriteEvents',
      desc: '',
      args: [],
    );
  }

  /// `Browse`
  String get user_side_browse {
    return Intl.message(
      'Browse',
      name: 'user_side_browse',
      desc: '',
      args: [],
    );
  }

  /// `Helper`
  String get user_side_helper {
    return Intl.message(
      'Helper',
      name: 'user_side_helper',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get user_side_home {
    return Intl.message(
      'Home',
      name: 'user_side_home',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get user_side_calendar {
    return Intl.message(
      'Calendar',
      name: 'user_side_calendar',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark`
  String get user_side_bookmark {
    return Intl.message(
      'Bookmark',
      name: 'user_side_bookmark',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get user_side_profile {
    return Intl.message(
      'Profile',
      name: 'user_side_profile',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get user_side_contact {
    return Intl.message(
      'Contact us',
      name: 'user_side_contact',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End User ========================================================' key

  // skipped getter for the '_======== User-Contact ========================================================' key

  /// `First Name`
  String get user_contact_form_name_first {
    return Intl.message(
      'First Name',
      name: 'user_contact_form_name_first',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get user_contact_form_name_last {
    return Intl.message(
      'Last name',
      name: 'user_contact_form_name_last',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get user_contact_form_email {
    return Intl.message(
      'E-Mail',
      name: 'user_contact_form_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get user_contact_form_phone {
    return Intl.message(
      'Phone Number',
      name: 'user_contact_form_phone',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get user_contact_form_message {
    return Intl.message(
      'Message',
      name: 'user_contact_form_message',
      desc: '',
      args: [],
    );
  }

  /// `Type your message here`
  String get user_contact_form_message_hint {
    return Intl.message(
      'Type your message here',
      name: 'user_contact_form_message_hint',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get user_contact {
    return Intl.message(
      'Contact Us',
      name: 'user_contact',
      desc: '',
      args: [],
    );
  }

  /// `Call Us`
  String get user_contact_call_us {
    return Intl.message(
      'Call Us',
      name: 'user_contact_call_us',
      desc: '',
      args: [],
    );
  }

  /// `Email Us`
  String get user_contact_email_us {
    return Intl.message(
      'Email Us',
      name: 'user_contact_email_us',
      desc: '',
      args: [],
    );
  }

  /// `Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.`
  String get user_contact_header {
    return Intl.message(
      'Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.',
      name: 'user_contact_header',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get user_contact_facebook {
    return Intl.message(
      'Facebook',
      name: 'user_contact_facebook',
      desc: '',
      args: [],
    );
  }

  /// `follow us on facebook`
  String get user_contact_facebook_msg {
    return Intl.message(
      'follow us on facebook',
      name: 'user_contact_facebook_msg',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get user_contact_instagram {
    return Intl.message(
      'Instagram',
      name: 'user_contact_instagram',
      desc: '',
      args: [],
    );
  }

  /// `follow us on instagram`
  String get user_contact_instagram_msg {
    return Intl.message(
      'follow us on instagram',
      name: 'user_contact_instagram_msg',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get user_contact_twitter {
    return Intl.message(
      'Twitter',
      name: 'user_contact_twitter',
      desc: '',
      args: [],
    );
  }

  /// `follow us on twitter`
  String get user_contact_twitter_msg {
    return Intl.message(
      'follow us on twitter',
      name: 'user_contact_twitter_msg',
      desc: '',
      args: [],
    );
  }

  /// `YouTube`
  String get user_contact_youtube {
    return Intl.message(
      'YouTube',
      name: 'user_contact_youtube',
      desc: '',
      args: [],
    );
  }

  /// `subscribe our channel`
  String get user_contact_youtube_msg {
    return Intl.message(
      'subscribe our channel',
      name: 'user_contact_youtube_msg',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get user_contact_whatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'user_contact_whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `contact us on whatsapp`
  String get user_contact_whatsapp_msg {
    return Intl.message(
      'contact us on whatsapp',
      name: 'user_contact_whatsapp_msg',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_contact_location {
    return Intl.message(
      'Location',
      name: 'user_contact_location',
      desc: '',
      args: [],
    );
  }

  /// `visit our location`
  String get user_contact_location_msg {
    return Intl.message(
      'visit our location',
      name: 'user_contact_location_msg',
      desc: '',
      args: [],
    );
  }

  /// `ACC Address:`
  String get user_contact_general_address {
    return Intl.message(
      'ACC Address:',
      name: 'user_contact_general_address',
      desc: '',
      args: [],
    );
  }

  /// `U.S. Embassy Cairo, 5 Tawfik Diab Street, Garden City.`
  String get user_contact_general_address_info {
    return Intl.message(
      'U.S. Embassy Cairo, 5 Tawfik Diab Street, Garden City.',
      name: 'user_contact_general_address_info',
      desc: '',
      args: [],
    );
  }

  /// `Opening Hours:`
  String get user_contact_general_time {
    return Intl.message(
      'Opening Hours:',
      name: 'user_contact_general_time',
      desc: '',
      args: [],
    );
  }

  /// `Monday - Thursday, 10:00 AM - 3:00 PM, Closed U.S. and Egyptian holidays.`
  String get user_contact_general_time_info {
    return Intl.message(
      'Monday - Thursday, 10:00 AM - 3:00 PM, Closed U.S. and Egyptian holidays.',
      name: 'user_contact_general_time_info',
      desc: '',
      args: [],
    );
  }

  /// `Free Membership`
  String get user_contact_general_membership {
    return Intl.message(
      'Free Membership',
      name: 'user_contact_general_membership',
      desc: '',
      args: [],
    );
  }

  /// `Join us now and get a free membership for 3 months.`
  String get user_contact_general_membership_info {
    return Intl.message(
      'Join us now and get a free membership for 3 months.',
      name: 'user_contact_general_membership_info',
      desc: '',
      args: [],
    );
  }

  /// `Special Announcements`
  String get user_contact_general_announcement {
    return Intl.message(
      'Special Announcements',
      name: 'user_contact_general_announcement',
      desc: '',
      args: [],
    );
  }

  /// `Stay tuned for our special announcements.`
  String get user_contact_general_announcement_info {
    return Intl.message(
      'Stay tuned for our special announcements.',
      name: 'user_contact_general_announcement_info',
      desc: '',
      args: [],
    );
  }

  /// `Further Inquiries`
  String get user_contact_general_inquiry {
    return Intl.message(
      'Further Inquiries',
      name: 'user_contact_general_inquiry',
      desc: '',
      args: [],
    );
  }

  /// `ACCairo@state.gov`
  String get user_contact_general_inquiry_info {
    return Intl.message(
      'ACCairo@state.gov',
      name: 'user_contact_general_inquiry_info',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End User-Contact ========================================================' key

  // skipped getter for the '_======== User-Event-Details ========================================================' key

  /// `Event Details`
  String get user_event_details_app_bar {
    return Intl.message(
      'Event Details',
      name: 'user_event_details_app_bar',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark`
  String get user_event_details_bookmark {
    return Intl.message(
      'Bookmark',
      name: 'user_event_details_bookmark',
      desc: '',
      args: [],
    );
  }

  /// `About Event`
  String get user_event_details_about {
    return Intl.message(
      'About Event',
      name: 'user_event_details_about',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get user_event_details_book_now {
    return Intl.message(
      'Book Now',
      name: 'user_event_details_book_now',
      desc: '',
      args: [],
    );
  }

  /// `Buy Ticket`
  String get user_event_details_buy_ticket {
    return Intl.message(
      'Buy Ticket',
      name: 'user_event_details_buy_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.`
  String get user_event_details_header {
    return Intl.message(
      'Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.',
      name: 'user_event_details_header',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get user_event_details_facebook {
    return Intl.message(
      'Facebook',
      name: 'user_event_details_facebook',
      desc: '',
      args: [],
    );
  }

  /// `follow us on facebook`
  String get user_event_details_facebook_msg {
    return Intl.message(
      'follow us on facebook',
      name: 'user_event_details_facebook_msg',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get user_event_details_instagram {
    return Intl.message(
      'Instagram',
      name: 'user_event_details_instagram',
      desc: '',
      args: [],
    );
  }

  /// `follow us on instagram`
  String get user_event_details_instagram_msg {
    return Intl.message(
      'follow us on instagram',
      name: 'user_event_details_instagram_msg',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get user_event_details_twitter {
    return Intl.message(
      'Twitter',
      name: 'user_event_details_twitter',
      desc: '',
      args: [],
    );
  }

  /// `follow us on twitter`
  String get user_event_details_twitter_msg {
    return Intl.message(
      'follow us on twitter',
      name: 'user_event_details_twitter_msg',
      desc: '',
      args: [],
    );
  }

  /// `YouTube`
  String get user_event_details_youtube {
    return Intl.message(
      'YouTube',
      name: 'user_event_details_youtube',
      desc: '',
      args: [],
    );
  }

  /// `subscribe our channel`
  String get user_event_details_youtube_msg {
    return Intl.message(
      'subscribe our channel',
      name: 'user_event_details_youtube_msg',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get user_event_details_whatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'user_event_details_whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `contact us on whatsapp`
  String get user_event_details_whatsapp_msg {
    return Intl.message(
      'contact us on whatsapp',
      name: 'user_event_details_whatsapp_msg',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_event_details_location {
    return Intl.message(
      'Location',
      name: 'user_event_details_location',
      desc: '',
      args: [],
    );
  }

  /// `visit our location`
  String get user_event_details_location_msg {
    return Intl.message(
      'visit our location',
      name: 'user_event_details_location_msg',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End User-Event-Details ========================================================' key

  // skipped getter for the '_======== User-Bookmark ========================================================' key

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

  /// `No bookmark events available`
  String get user_bookmark_empty {
    return Intl.message(
      'No bookmark events available',
      name: 'user_bookmark_empty',
      desc: '',
      args: [],
    );
  }

  /// `Event Details`
  String get user_bookmark_app_bar {
    return Intl.message(
      'Event Details',
      name: 'user_bookmark_app_bar',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark`
  String get user_bookmark_bookmark {
    return Intl.message(
      'Bookmark',
      name: 'user_bookmark_bookmark',
      desc: '',
      args: [],
    );
  }

  /// `About Event`
  String get user_bookmark_about {
    return Intl.message(
      'About Event',
      name: 'user_bookmark_about',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get user_bookmark_book_now {
    return Intl.message(
      'Book Now',
      name: 'user_bookmark_book_now',
      desc: '',
      args: [],
    );
  }

  /// `Buy Ticket`
  String get user_bookmark_buy_ticket {
    return Intl.message(
      'Buy Ticket',
      name: 'user_bookmark_buy_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.`
  String get user_bookmark_header {
    return Intl.message(
      'Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.',
      name: 'user_bookmark_header',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get user_bookmark_facebook {
    return Intl.message(
      'Facebook',
      name: 'user_bookmark_facebook',
      desc: '',
      args: [],
    );
  }

  /// `follow us on facebook`
  String get user_bookmark_facebook_msg {
    return Intl.message(
      'follow us on facebook',
      name: 'user_bookmark_facebook_msg',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get user_bookmark_instagram {
    return Intl.message(
      'Instagram',
      name: 'user_bookmark_instagram',
      desc: '',
      args: [],
    );
  }

  /// `follow us on instagram`
  String get user_bookmark_instagram_msg {
    return Intl.message(
      'follow us on instagram',
      name: 'user_bookmark_instagram_msg',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get user_bookmark_twitter {
    return Intl.message(
      'Twitter',
      name: 'user_bookmark_twitter',
      desc: '',
      args: [],
    );
  }

  /// `follow us on twitter`
  String get user_bookmark_twitter_msg {
    return Intl.message(
      'follow us on twitter',
      name: 'user_bookmark_twitter_msg',
      desc: '',
      args: [],
    );
  }

  /// `YouTube`
  String get user_bookmark_youtube {
    return Intl.message(
      'YouTube',
      name: 'user_bookmark_youtube',
      desc: '',
      args: [],
    );
  }

  /// `subscribe our channel`
  String get user_bookmark_youtube_msg {
    return Intl.message(
      'subscribe our channel',
      name: 'user_bookmark_youtube_msg',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get user_bookmark_whatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'user_bookmark_whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `contact us on whatsapp`
  String get user_bookmark_whatsapp_msg {
    return Intl.message(
      'contact us on whatsapp',
      name: 'user_bookmark_whatsapp_msg',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_bookmark_location {
    return Intl.message(
      'Location',
      name: 'user_bookmark_location',
      desc: '',
      args: [],
    );
  }

  /// `visit our location`
  String get user_bookmark_location_msg {
    return Intl.message(
      'visit our location',
      name: 'user_bookmark_location_msg',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End User-Bookmark ========================================================' key

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

  // skipped getter for the '_======== Admin-Event ========================================================' key

  /// `event will be held in embassy`
  String get admin_event_held_in_embassy {
    return Intl.message(
      'event will be held in embassy',
      name: 'admin_event_held_in_embassy',
      desc: '',
      args: [],
    );
  }

  /// `event will be held out embassy`
  String get admin_event_held_out_embassy {
    return Intl.message(
      'event will be held out embassy',
      name: 'admin_event_held_out_embassy',
      desc: '',
      args: [],
    );
  }

  /// `Area Name`
  String get admin_event_input_area {
    return Intl.message(
      'Area Name',
      name: 'admin_event_input_area',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get admin_event_input_address {
    return Intl.message(
      'Address',
      name: 'admin_event_input_address',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get admin_event_input_title {
    return Intl.message(
      'Title',
      name: 'admin_event_input_title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get admin_event_input_description {
    return Intl.message(
      'Description',
      name: 'admin_event_input_description',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get admin_event_input_price {
    return Intl.message(
      'Price',
      name: 'admin_event_input_price',
      desc: '',
      args: [],
    );
  }

  /// `Google Map URL`
  String get admin_event_input_map {
    return Intl.message(
      'Google Map URL',
      name: 'admin_event_input_map',
      desc: '',
      args: [],
    );
  }

  /// `event created successfully`
  String get admin_event_create {
    return Intl.message(
      'event created successfully',
      name: 'admin_event_create',
      desc: '',
      args: [],
    );
  }

  /// `event updated successfully`
  String get admin_event_update {
    return Intl.message(
      'event updated successfully',
      name: 'admin_event_update',
      desc: '',
      args: [],
    );
  }

  /// `Event Deleted Successfully`
  String get admin_event_deleted_msg {
    return Intl.message(
      'Event Deleted Successfully',
      name: 'admin_event_deleted_msg',
      desc: '',
      args: [],
    );
  }

  /// `Please add an event`
  String get admin_event_add_msg {
    return Intl.message(
      'Please add an event',
      name: 'admin_event_add_msg',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End Admin-Event ========================================================' key

  // skipped getter for the '_======== Admin-Event-Details ========================================================' key

  /// `About Event`
  String get admin_event_details_about {
    return Intl.message(
      'About Event',
      name: 'admin_event_details_about',
      desc: '',
      args: [],
    );
  }

  /// `Attendees`
  String get admin_event_details_attendees {
    return Intl.message(
      'Attendees',
      name: 'admin_event_details_attendees',
      desc: '',
      args: [],
    );
  }

  /// `no attendees present`
  String get admin_event_details_attendees_empty {
    return Intl.message(
      'no attendees present',
      name: 'admin_event_details_attendees_empty',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get admin_event_details_see_all {
    return Intl.message(
      'See All',
      name: 'admin_event_details_see_all',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get admin_event_details_dialog_personal_info {
    return Intl.message(
      'Personal Information',
      name: 'admin_event_details_dialog_personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get admin_event_details_dialog_name {
    return Intl.message(
      'Name',
      name: 'admin_event_details_dialog_name',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get admin_event_details_dialog_email {
    return Intl.message(
      'E-Mail',
      name: 'admin_event_details_dialog_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get admin_event_details_dialog_phone {
    return Intl.message(
      'Phone',
      name: 'admin_event_details_dialog_phone',
      desc: '',
      args: [],
    );
  }

  /// `Event Details`
  String get admin_event_details_app_bar {
    return Intl.message(
      'Event Details',
      name: 'admin_event_details_app_bar',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End Admin-Event-Details ========================================================' key

  // skipped getter for the '_======== Admin-Request ========================================================' key

  /// `Rejected`
  String get admin_request_tab_reject {
    return Intl.message(
      'Rejected',
      name: 'admin_request_tab_reject',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get admin_request_tab_approve {
    return Intl.message(
      'Approved',
      name: 'admin_request_tab_approve',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get admin_request_tab_waiting {
    return Intl.message(
      'Waiting',
      name: 'admin_request_tab_waiting',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get admin_request_tab_pending {
    return Intl.message(
      'Pending',
      name: 'admin_request_tab_pending',
      desc: '',
      args: [],
    );
  }

  /// `No Requests`
  String get admin_request_empty {
    return Intl.message(
      'No Requests',
      name: 'admin_request_empty',
      desc: '',
      args: [],
    );
  }

  /// `request accepted`
  String get admin_request_accept_msg {
    return Intl.message(
      'request accepted',
      name: 'admin_request_accept_msg',
      desc: '',
      args: [],
    );
  }

  /// `request rejected`
  String get admin_request_reject_msg {
    return Intl.message(
      'request rejected',
      name: 'admin_request_reject_msg',
      desc: '',
      args: [],
    );
  }

  /// `request approved`
  String get admin_request_approved_msg {
    return Intl.message(
      'request approved',
      name: 'admin_request_approved_msg',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '_========  End Admin-Request ========================================================' key
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
