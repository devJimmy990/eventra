import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/home/cubit/event_state.dart';
import 'package:eventra/features/admin/home/presentation/widget/previous_events.dart';
import 'package:eventra/features/admin/home/presentation/widget/upcoming_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminExploreView extends StatefulWidget {
  const AdminExploreView({super.key});

  @override
  State<AdminExploreView> createState() => _AdminExploreViewState();
}

class _AdminExploreViewState extends State<AdminExploreView>
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
        title: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Upcoming"),
            Tab(text: "Previous"),
          ],
        ),
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
