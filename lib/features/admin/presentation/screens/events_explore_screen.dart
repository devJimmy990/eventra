import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/cubit/event/event_cubit.dart';
import 'package:eventra/features/admin/cubit/event/event_state.dart';
import 'package:eventra/features/admin/presentation/widget/previous_events.dart';
import 'package:eventra/features/admin/presentation/widget/upcoming_events.dart';

class AdminEventsExploreScreen extends StatefulWidget {
  const AdminEventsExploreScreen({super.key});

  @override
  State<AdminEventsExploreScreen> createState() =>
      _AdminEventsExploreScreenState();
}

class _AdminEventsExploreScreenState extends State<AdminEventsExploreScreen>
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
      final eventCubit = context.read<AdminEventCubit>();
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
        title: _CustomTabBar(_tabController),
      ),
      body: BlocBuilder<AdminEventCubit, AdminEventState>(
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

class _CustomTabBar extends StatelessWidget {
  final TabController? controller;
  const _CustomTabBar(this.controller);

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: 0.8.sw,
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: TabBar(
          controller: controller,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 14.sp),
          dividerColor: Colors.transparent,
          tabs:
              [Localization.adminExploreTabUpComing, Localization.adminExploreTabPrevious]
                  .map((label) => Tab(
                        child: Text(
                          label,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ))
                  .toList(),
        ),
      ),
    );
  }
}
