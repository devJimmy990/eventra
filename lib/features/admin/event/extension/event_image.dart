import 'dart:io';
import 'package:flutter/material.dart';

extension EventImageExtension on String {
  Widget asEventImage({BoxFit fit = BoxFit.cover}) {
    return startsWith('/')
        ? Image.file(File(this), fit: fit)
        : Image.asset(this, fit: fit);
  }
}