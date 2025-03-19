import 'package:flutter/material.dart';

class Menu {
  final String title;
  final IconData icon;
  final String routeName; // new property

  Menu({
    required this.title,
    required this.icon,
    required this.routeName,
  });
}
