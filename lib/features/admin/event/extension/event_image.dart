import 'dart:io';
import 'package:flutter/material.dart';

extension EventImageExtension on String {
  Widget asEventImage({BoxFit cover = BoxFit.cover}) {
    return startsWith('/')
        ? Image.file(File(this), fit: cover)
        : Image.asset(this, fit: cover);
  }
}