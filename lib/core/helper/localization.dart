import 'package:flutter/material.dart';
import 'package:eventra/generated/l10n.dart';

class Localization {
  final BuildContext _context;

  Localization(this._context);

//-------------------- General -----------------------------------------
  get generalAppName => S.of(_context).appName;

  get themeDark => S.of(_context).theme_dark;
  get themeLight => S.of(_context).theme_light;
  get themeSwitch => S.of(_context).theme_switch;

  get languageSwitch => S.of(_context).language_switch;
  get languageArabic => S.of(_context).language_arabic;
  get languageEnglish => S.of(_context).language_english;

  get dialogCancel => S.of(_context).dialog_cancel;
  get dialogDelete => S.of(_context).dialog_delete;
  get dialogConfirmDelete => S.of(_context).dialog_confirm_delete;
  get dialogOk => S.of(_context).dialog_ok;
  get snackBarUndo => S.of(_context).snackbar_undo;
//----------------------------------------------------------------------

//-------------------- Inputs Validator --------------------------------
  get validatorEmpty => S.of(_context).validator_empty;
  get validatorLongName => S.of(_context).validator_long_name;
  get validatorShortName => S.of(_context).validator_short_name;
  get validatorInvalidPhone => S.of(_context).validator_invalid_phone;
  get validatorInvalidEmail => S.of(_context).validator_invalid_email;
  get validatorShortMessage => S.of(_context).validator_short_message;
  get validatorShortPassword => S.of(_context).validator_short_password;
  get validatorPasswordNotMatch => S.of(_context).validator_password_not_match;

  get validatorFirebaseUsedEmail =>
      S.of(_context).validator_firebase_used_email;
  get validatorFirebaseWeakPassword =>
      S.of(_context).validator_firebase_weak_password;
  get validatorFirebaseInvalidCredentials =>
      S.of(_context).validator_firebase_invalid_credentials;
//----------------------------------------------------------------------

//-------------------- Auth --------------------------------------------
  get authInputEmail => S.of(_context).auth_input_email;
  get authInputPhone => S.of(_context).auth_input_phone;
  get authInputPassword => S.of(_context).auth_input_password;
  get authInputFullName => S.of(_context).auth_input_full_name;
  get authInputConfirmPassword => S.of(_context).auth_input_confirm_password;

  get authBtnSignOut => S.of(_context).auth_btn_logout;
  get authBtnSignIn => S.of(_context).auth_btn_sign_in;
  get authBtnSignUp => S.of(_context).auth_btn_sign_up;
  get authBtnForgetPassword => S.of(_context).auth_btn_forget_password;
  get authBtnSignInWithGoogle => S.of(_context).auth_btn_sign_in_google;

  get authTabSignIn => S.of(_context).auth_tab_sign_in;
  get authTabSignUp => S.of(_context).auth_tab_sign_up;

  get authRememberMsg => S.of(_context).auth_remember_msg;
  get authToggleRemember => S.of(_context).auth_toggle_remember_me;
//----------------------------------------------------------------------

//-------------------- Profile --------------------------------------------
  get profileInfo => S.of(_context).profile_info;
  get profileSettings => S.of(_context).profile_settings;
  get profileInfoName => S.of(_context).profile_info_name;
  get profileInfoEmail => S.of(_context).profile_info_email;
  get profileInfoPhone => S.of(_context).profile_info_phone;
  get profileTheme => S.of(_context).profile_settings_theme;
  get profileDataUpdated => S.of(_context).profile_data_updated;
  get profileLanguage => S.of(_context).profile_settings_language;
  get profileInfoEmpty => S.of(_context).profile_info_phone_empty;
  get profileAvatarUpload => S.of(_context).profile_avatar_upload;
  get profileAvatarSaving => S.of(_context).profile_avatar_save;
  get profileAvatarChanged => S.of(_context).profile_avatar_change;
  get profileInfoInterests => S.of(_context).profile_info_interests;
  get profileSaveChanges => S.of(_context).profile_save_changes;
//----------------------------------------------------------------------

//-------------------- Admin --------------------------------------------
  get adminHomeAppBar => S.of(_context).admin_app_bar_title;
  get adminExploreTabUpComing => S.of(_context).admin_explore_tab_up_coming;
  get adminExploreTabPrevious => S.of(_context).admin_explore_tab_previous;
  get adminProfileAvatarChange => S.of(_context).profile_avatar_change;
  get adminProfileAvatarUpload => S.of(_context).profile_avatar_upload;
//----------------------------------------------------------------------

//-------------------- User --------------------------------------------
  get userEventDetailsWait => S.of(_context).user_event_details_wait;
  get userEventDetailsReject => S.of(_context).user_event_details_reject;
  get userEventDetailsQR => S.of(_context).user_event_details_qr;
  get userBookmarkDeletingMsg => S.of(_context).user_bookmark_deleting_msg;
  get userBookmarkDeleted => S.of(_context).user_bookmark_deleted_msg;
  get userBookmark => S.of(_context).admin_explore_tab_previous;
//----------------------------------------------------------------------
  // get googleSignIn => S.of(_context).SignInWithGoogle;
  get events => S.of(_context).events;
  get welcomeAdmin => S.of(_context).welcomeAdmin;
  get upcoming => S.of(_context).upcoming;
  get previous => S.of(_context).previous;
  get eventDetails => S.of(_context).eventDetails;
  get aboutEvent => S.of(_context).aboutEvent;
  get attendees => S.of(_context).attendees;
  get seeAll => S.of(_context).seeAll;
  get noAttendeesPresent => S.of(_context).noAttendeesPresent;
  get eventsRequest => S.of(_context).eventsRequest;
  get settings => S.of(_context).settings;
  get english => S.of(_context).english;
  get createEvent => S.of(_context).createEvent;
  get noDataAvailable => S.of(_context).noDataAvailable;
  get eventDeletedSuccessfully => S.of(_context).eventDeletedSuccessfully;
  get dontHaveAnAccount => S.of(_context).dontHaveAnAccount;
  get create => S.of(_context).create;
  get notificationScreen => S.of(_context).notificationScreen;
  get eventCalendar => S.of(_context).eventCalendar;
  get noEventsAvailable => S.of(_context).noEventsAvailable;
  get bookmark => S.of(_context).bookmark;
  get calendar => S.of(_context).calendar;
  get bookNow => S.of(_context).bookNow;
  get buyTicket => S.of(_context).buyTicket;
  get explore => S.of(_context).explore;
  get contactUs => S.of(_context).contactUs;
  get callUs => S.of(_context).callUs;
  get emailUs => S.of(_context).emailUs;

  // get create => S.of(_context).create;
  // get create => S.of(_context).create;
  // Added for GeneralInfoBottomSheet
  get accAddress => S.of(_context).accAddress;
  get accAddressDetails => S.of(_context).accAddressDetails;
  get openingHours => S.of(_context).openingHours;
  get openingHoursDetails => S.of(_context).openingHoursDetails;
  get freeMembership => S.of(_context).freeMembership;
  get freeMembershipDetails => S.of(_context).freeMembershipDetails;
  get specialAnnouncements => S.of(_context).specialAnnouncements;
  get specialAnnouncementsDetails => S.of(_context).specialAnnouncementsDetails;
  get furtherInquiries => S.of(_context).furtherInquiries;
  get furtherInquiriesDetails => S.of(_context).furtherInquiriesDetails;
  // favorite (bookmarks)
  get favoriteEvents => S.of(_context).favoriteEvents;
  get userBookmarkEmpty => S.of(_context).user_bookmark_empty;
  // get appName => S.of(_context).appName;
  // onboarding screen
  get skip => S.of(_context).skip;
  get getStarted => S.of(_context).getStarted;
  //
  get ok => S.of(_context).ok;
  // signupScreen
  get alreadyHaveAnAccount => S.of(_context).alreadyHaveAnAccount;
  get login => S.of(_context).login;
  //
  get pleaseAddAnEvent => S.of(_context).pleaseAddAnEvent;
  // Card
  get eventWillBeHeldInEmbassy => S.of(_context).eventWillBeHeldInEmbassy;
  get eventWillBeHeldInOther => S.of(_context).eventWillBeHeldInOther;
  get areaName => S.of(_context).areaName;
  get required => S.of(_context).required;
  get address => S.of(_context).address;
  get googleMapUrl => S.of(_context).googleMapUrl;
}
