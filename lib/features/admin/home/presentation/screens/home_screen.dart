import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/home/cubit/event_state.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/home/presentation/widget/admin_drawer.dart';
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
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndexChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndexChange() {
    if (_tabController.indexIsChanging) {
      final eventCubit = context.read<EventCubit>();
      if (_tabController.index == 0) {
        eventCubit.filterEvents(EventFilter.upcoming);
      } else {
        eventCubit.filterEvents(EventFilter.past);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Welcome Admin',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Upcoming"),
            Tab(text: "Previous"),
          ],
        ),
      ),
      drawer: AdminDrawer(),
      body: BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          return TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              UpcomingEvents(),
              PreviousEvents(),
            ],
          );
        },
      ),
    );
  }
}
