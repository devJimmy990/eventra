import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/home/presentation/widget/previous_events.dart';
import 'package:eventra/features/admin/home/presentation/widget/upcoming_events.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabIndexChange);
    // Load all events initially.
    context.read<EventCubit>().getEvents(EventFilter.all);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndexChange);
    _tabController.dispose();
    super.dispose();
  }

  // Function to handle tab index changes
  void _handleTabIndexChange() {
    if (_tabController.indexIsChanging) {
      if (_tabController.index == 0) {
        context.read<EventCubit>().getEvents(EventFilter.upcoming);
      } else {
        context.read<EventCubit>().getEvents(EventFilter.past);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: Colors.amber,
            child: Text("AR"),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Welcome Admin',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => context.pushNamed(Routes.settings),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Upcoming"),
            Tab(text: "Previous"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          UpcomingEvents(),
          PreviousEvents(),
        ],
      ),
    );
  }
}
