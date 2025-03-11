import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Localization strings = Localization(context);

    return Scaffold(
      body: Center(
        child: Text(strings.notificationScreen),
      ),
    );
  }
}
