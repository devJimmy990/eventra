import 'package:eventra/generated/l10n.dart';

class Localization {
//-------------------- General -----------------------------------------
  static get generalAppName => S.current.appName;

  static get themeDark => S.current.theme_dark;
  static get themeLight => S.current.theme_light;
  static get themeSwitch => S.current.theme_switch;

  static get languageSwitch => S.current.language_switch;
  static get languageArabic => S.current.language_arabic;
  static get languageEnglish => S.current.language_english;

  static get cancel => S.current.cancel;
  static get delete => S.current.delete;
  static get confirmDelete => S.current.confirm_delete;
  static get ok => S.current.ok;
  static get send => S.current.send;
  static get error => S.current.error;
  static get undo => S.current.undo;
  static get reject => S.current.reject;
  static get accept => S.current.accept;
  static get approve => S.current.approve;
  static get wait => S.current.wait;
  static get from => S.current.from;
  static get to => S.current.to;
  static get selectDate => S.current.select_date;
//----------------------------------------------------------------------

//-------------------- Inputs Validator --------------------------------
  static get validatorEmpty => S.current.validator_empty;
  static get validatorLongName => S.current.validator_long_name;
  static get validatorShortName => S.current.validator_short_name;
  static get validatorInvalidPhone => S.current.validator_invalid_phone;
  static get validatorInvalidEmail => S.current.validator_invalid_email;
  static get validatorShortMessage => S.current.validator_short_message;
  static get validatorShortPassword => S.current.validator_short_password;
  static get validatorPasswordNotMatch =>
      S.current.validator_password_not_match;

  static get validatorFirebaseUsedEmail =>
      S.current.validator_firebase_used_email;
  static get validatorFirebaseWeakPassword =>
      S.current.validator_firebase_weak_password;
  static get validatorFirebaseInvalidCredentials =>
      S.current.validator_firebase_invalid_credentials;
//----------------------------------------------------------------------

//-------------------- Auth --------------------------------------------
  static get authInputEmail => S.current.auth_input_email;
  static get authInputPhone => S.current.auth_input_phone;
  static get authInputPassword => S.current.auth_input_password;
  static get authInputFullName => S.current.auth_input_full_name;
  static get authInputConfirmPassword => S.current.auth_input_confirm_password;

  static get authBtnSignOut => S.current.auth_btn_logout;
  static get authBtnSignIn => S.current.auth_btn_sign_in;
  static get authBtnSignUp => S.current.auth_btn_sign_up;
  static get authBtnForgetPassword => S.current.auth_btn_forget_password;
  static get authBtnSignInWithGoogle => S.current.auth_btn_sign_in_google;

  static get authTabSignIn => S.current.auth_tab_sign_in;
  static get authTabSignUp => S.current.auth_tab_sign_up;

  static get authRememberMsg => S.current.auth_remember_msg;
  static get authToggleRemember => S.current.auth_toggle_remember_me;
//----------------------------------------------------------------------

//-------------------- Profile --------------------------------------------
  static get userProfile => S.current.user_profile;
  static get adminProfile => S.current.admin_profile;
  static get profileInfo => S.current.profile_info;
  static get profileSettings => S.current.profile_settings;
  static get profileInfoName => S.current.profile_info_name;
  static get profileInfoEmail => S.current.profile_info_email;
  static get profileInfoPhone => S.current.profile_info_phone;
  static get profileTheme => S.current.profile_settings_theme;
  static get profileDataUpdated => S.current.profile_data_updated;
  static get profileLanguage => S.current.profile_settings_language;
  static get profileInfoEmpty => S.current.profile_info_phone_empty;
  static get profileAvatarUpload => S.current.profile_avatar_upload;
  static get profileAvatarSaving => S.current.profile_avatar_save;
  static get profileAvatarChanged => S.current.profile_avatar_change;
  static get profileInfoInterests => S.current.profile_info_interests;
  static get profileInfoSelectInterests =>
      S.current.profile_info_select_interests;
  static get profileSaveChanges => S.current.profile_save_changes;
//----------------------------------------------------------------------

//-------------------- User --------------------------------------------
  static get userEventDetailsWait => S.current.user_event_details_wait;
  static get userEventDetailsReject => S.current.user_event_details_reject;
  static get userEventDetailsQR => S.current.user_event_details_qr;

  static get userHomeAppBar => S.current.user_home_app_bar;
  static get userExploreUpcomingEmpty => S.current.user_home_upcoming_empty;
  static get userEventCalendar => S.current.event_calendar;
  static get userEmptyEvent => S.current.no_event_available;

  static get userEventDetailsAppBar => S.current.user_event_details_app_bar;
  static get userEventDetailsBookmark => S.current.user_event_details_bookmark;
  static get userEventDetailsAbout => S.current.user_event_details_about;
  static get userEventDetailsBook => S.current.user_event_details_book_now;
  static get userEventDetailsBuy => S.current.user_event_details_buy_ticket;

  static get userContact => S.current.user_contact;
  static get userContactFormNameFirst => S.current.user_contact_form_name_first;
  static get userContactFormNameLast => S.current.user_contact_form_name_last;
  static get userContactFormEmail => S.current.user_contact_form_email;
  static get userContactFormPhone => S.current.user_contact_form_phone;
  static get userContactFormMessage => S.current.user_contact_form_message;
  static get userContactFormMessageHint =>
      S.current.user_contact_form_message_hint;
  static get userContactForm => S.current.user_contact;
  static get userContactHeader => S.current.user_contact_header;
  static get userContactCallUs => S.current.user_contact_call_us;
  static get userContactEmailUs => S.current.user_contact_email_us;
  static get userContactFacebook => S.current.user_contact_facebook;
  static get userContactFacebookMsg => S.current.user_contact_facebook_msg;
  static get userContactInstagram => S.current.user_contact_instagram;
  static get userContactInstagramMsg => S.current.user_contact_instagram_msg;
  static get userContactTwitter => S.current.user_contact_twitter;
  static get userContactTwitterMsg => S.current.user_contact_twitter_msg;
  static get userContactYoutube => S.current.user_contact_youtube;
  static get userContactYoutubeMsg => S.current.user_contact_youtube_msg;
  static get userContactWhats => S.current.user_contact_whatsapp;
  static get userContactWhatsMsg => S.current.user_contact_whatsapp_msg;
  static get userContactLocation => S.current.user_contact_location;
  static get userContactLocationMsg => S.current.user_contact_location_msg;

  static get userContactAddress => S.current.user_contact_general_address;
  static get userContactAddressInfo =>
      S.current.user_contact_general_address_info;
  static get userContactTime => S.current.user_contact_general_time;
  static get userContactTimeInfo => S.current.user_contact_general_time_info;
  static get userContactMembership => S.current.user_contact_general_membership;
  static get userContactMembershipInfo =>
      S.current.user_contact_general_membership_info;
  static get userContactAnnouncements =>
      S.current.user_contact_general_announcement;
  static get userContactAnnouncementsInfo =>
      S.current.user_contact_general_announcement_info;
  static get userContactInquiry => S.current.user_contact_general_inquiry;
  static get userContactInquiryInfo =>
      S.current.user_contact_general_inquiry_info;

  static get userBookmarkDeletingMsg => S.current.user_bookmark_deleting_msg;
  static get userEventDeletingMsg => S.current.user_event_deleting_msg;
  static get userBookmarkDeleted => S.current.user_bookmark_deleted_msg;
  static get userBookmarkEmpty => S.current.user_bookmark_empty;
  static get userBookmarkAppBar => S.current.user_bookmark_app_bar;

  static get userSideBrowse => S.current.user_side_browse;
  static get userSideHelper => S.current.user_side_helper;
  static get userSideHome => S.current.user_side_home;
  static get userSideCalendar => S.current.user_side_calendar;
  static get userSideBookmark => S.current.user_side_bookmark;
  static get userSideProfile => S.current.user_side_profile;
  static get userSideContact => S.current.user_side_contact;
//-------------------- User --------------------------------------------

//-------------------- Admin --------------------------------------------
  static get adminHomeAppBar => S.current.admin_app_bar_title;
  static get adminExploreTabUpComing => S.current.admin_explore_tab_up_coming;
  static get adminExploreTabPrevious => S.current.admin_explore_tab_previous;
  static get adminProfileAvatarChange => S.current.profile_avatar_change;
  static get adminProfileAvatarUpload => S.current.profile_avatar_upload;

  static get adminEventHeldInEmbassy => S.current.admin_event_held_in_embassy;
  static get adminEventHeldOutEmbassy => S.current.admin_event_held_out_embassy;
  static get adminEventInputArea => S.current.admin_event_input_area;
  static get adminEventInputAddress => S.current.admin_event_input_address;
  static get adminEventInputMap => S.current.admin_event_input_map;
  static get adminEventCreate => S.current.admin_event_create;
  static get adminEventUpdate => S.current.admin_event_update;
  static get adminEventDeletedMsg => S.current.admin_event_deleted_msg;
  static get adminEventAddMsg => S.current.admin_event_add_msg;
  static get adminEventInputTitle => S.current.admin_event_input_title;
  static get adminEventInputDescription =>
      S.current.admin_event_input_description;
  static get adminEventInputPrice => S.current.admin_event_input_price;
  static get adminEventDetailsAppBar => S.current.admin_event_details_app_bar;
  static get adminEventDetailsAbout => S.current.admin_event_details_about;
  static get adminEventDetailsAttendees =>
      S.current.admin_event_details_attendees;
  static get adminEventDetailsAttendeesEmpty =>
      S.current.admin_event_details_attendees_empty;
  static get adminEventDetailsSeeAll => S.current.admin_event_details_see_all;
  static get adminEventDetailsDialogPersonalInfo =>
      S.current.admin_event_details_dialog_personal_info;
  static get adminEventDetailsDialogName =>
      S.current.admin_event_details_dialog_name;
  static get adminEventDetailsDialogEmail =>
      S.current.admin_event_details_dialog_email;
  static get adminEventDetailsDialogPhone =>
      S.current.admin_event_details_dialog_phone;

  static get adminRequestEmpty => S.current.admin_request_empty;
  static get adminRequestAcceptedMsg => S.current.admin_request_accept_msg;
  static get adminRequestRejectedMsg => S.current.admin_request_reject_msg;
  static get adminRequestRejected => S.current.admin_request_tab_reject;
  static get adminRequestApproved => S.current.admin_request_tab_approve;
  static get adminRequestWaiting => S.current.admin_request_tab_waiting;
  static get adminRequestPending => S.current.admin_request_tab_pending;
  static get adminRequestApprovedMsg => S.current.admin_request_approved_msg;
//----------------------------------------------------------------------

//----------------------------------------------------------------------
  // static get googleSignIn => S.of(_context).SignInWithGoogle;
  // get upcoming => S.of(_context).upcoming;
  // get previous => S.of(_context).previous;
  // get eventDetails => S.of(_context).eventDetails;
  // get aboutEvent => S.of(_context).aboutEvent;
  // get attendees => S.of(_context).attendees;
  // get seeAll => S.of(_context).seeAll;
  // get noAttendeesPresent => S.of(_context).noAttendeesPresent;
  // get eventsRequest => S.of(_context).eventsRequest;
  // get settings => S.of(_context).settings;
  // get english => S.of(_context).english;
  // get createEvent => S.of(_context).createEvent;
  // get noDataAvailable => S.of(_context).noDataAvailable;
  // get eventDeletedSuccessfully => S.of(_context).eventDeletedSuccessfully;
  // get dontHaveAnAccount => S.of(_context).dontHaveAnAccount;
  // get create => S.of(_context).create;
  // get notificationScreen => S.of(_context).notificationScreen;
  //
  // get bookmark => S.of(_context).bookmark;
  // get calendar => S.of(_context).calendar;
  // get bookNow => S.of(_context).bookNow;
  // get buyTicket => S.of(_context).buyTicket;
  // get explore => S.of(_context).explore;
  //
  // // Added for GeneralInfoBottomSheet
  // get accAddress => S.of(_context).accAddress;
  // get accAddressDetails => S.of(_context).accAddressDetails;
  // get openingHours => S.of(_context).openingHours;
  // get openingHoursDetails => S.of(_context).openingHoursDetails;
  // get freeMembership => S.of(_context).freeMembership;
  // get freeMembershipDetails => S.of(_context).freeMembershipDetails;
  // get specialAnnouncements => S.of(_context).specialAnnouncements;
  // get specialAnnouncementsDetails => S.of(_context).specialAnnouncementsDetails;
  // get furtherInquiries => S.of(_context).furtherInquiries;
  // get furtherInquiriesDetails => S.of(_context).furtherInquiriesDetails;
  // // favorite (bookmarks)
  // // get appName => S.of(_context).appName;
  // // onboarding screen
  // get skip => S.of(_context).skip;
  // get getStarted => S.of(_context).getStarted;
  // //
  // get ok => S.of(_context).ok;
  // // signupScreen
  // get alreadyHaveAnAccount => S.of(_context).alreadyHaveAnAccount;
  // get login => S.of(_context).login;
  // //
  // get pleaseAddAnEvent => S.of(_context).pleaseAddAnEvent;
  // // Card
  // get eventWillBeHeldInEmbassy => S.of(_context).eventWillBeHeldInEmbassy;
  // get eventWillBeHeldInOther => S.of(_context).eventWillBeHeldInOther;
  // get areaName => S.of(_context).areaName;
  // get required => S.of(_context).required;
  // get address => S.of(_context).address;
  // get googleMapUrl => S.of(_context).googleMapUrl;
}
