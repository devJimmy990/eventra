import 'package:eventra/core/constants/extensions.dart';
import 'package:eventra/features/admin/presentation/view/event_request/event_request_view.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/presentation/screens/profile_screen.dart';
import 'package:eventra/features/admin/presentation/screens/events_explore_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Localization strings = Localization(context);
    final admin = context.read<UserCubit>().user!;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => AdminProfileScreen())),
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage:
                  admin.avatar != null ? NetworkImage(admin.avatar!) : null,
              child: admin.avatar == null
                  ? Text(
                      admin.name.abbreviate(),
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    )
                  : null,
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
