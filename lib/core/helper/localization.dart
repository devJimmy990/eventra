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
  get data => S.of(_context).data;
  get logout => S.of(_context).logout;
  get settings => S.of(_context).settings;
  get createEvent => S.of(_context).createEvent;
  get noDataAvailable => S.of(_context).noDataAvailable;
  get eventDeletedSuccessfully => S.of(_context).eventDeletedSuccessfully;
  get signIn => S.of(_context).signIn;
  get signUp => S.of(_context).signUp;
  get dontHaveAnAccount => S.of(_context).dontHaveAnAccount;
  get create => S.of(_context).create;
}
