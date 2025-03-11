import 'package:eventra/generated/l10n.dart';
import 'package:flutter/material.dart';

class Localization {
  final BuildContext _context;

  Localization(this._context);

  get googleSignIn => S.of(_context).SignInWithGoogle;
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
  get logout => S.of(_context).logout;
  get settings => S.of(_context).settings;
  get createEvent => S.of(_context).createEvent;
  get noDataAvailable => S.of(_context).noDataAvailable;
  get eventDeletedSuccessfully => S.of(_context).eventDeletedSuccessfully;
  get signIn => S.of(_context).signIn;
  get signUp => S.of(_context).signUp;
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
  get data => S.of(_context).data;
    get appName => S.of(_context).appName;
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
