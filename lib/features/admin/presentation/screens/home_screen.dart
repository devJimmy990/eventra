import 'package:eventra/features/admin/presentation/view/event_request/event_request_view.dart';
import 'package:flutter/material.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/presentation/screens/profile_screen.dart';
import 'package:eventra/features/admin/presentation/screens/events_explore_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Localization strings = Localization(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => AdminProfileScreen())),
            child: CircleAvatar(
              radius: 20,
              child: Text("AD"),
            ),
          ),
        ),
        title: Text(
          strings.adminHomeAppBar,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              isDismissible: true,
              isScrollControlled: true,
              builder: (_) => AdminEventsRequestsBottomSheet(),
            ),
            icon: Icon(
              Icons.notifications,
              size: 28.r,
            ),
          )
        ],
      ),
      body: AdminEventsExploreScreen(),
    );
  }
}
