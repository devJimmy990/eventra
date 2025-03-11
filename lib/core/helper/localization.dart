import 'package:eventra/generated/l10n.dart';
import 'package:flutter/material.dart';

class Localization {
  final BuildContext _context;

  Localization(this._context);

  get googleSignIn => S.of(_context).SignInWithGoogle;
}
