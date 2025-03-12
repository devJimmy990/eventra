import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';

class AdminEventsRequestsView extends StatelessWidget {
  const AdminEventsRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Localization strings = Localization(context);

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, inx) => Text(strings.data),
    );
  }
}
