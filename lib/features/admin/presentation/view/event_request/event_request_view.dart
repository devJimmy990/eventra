import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/admin/cubit/requests/request_cubit.dart';
import 'package:eventra/features/admin/cubit/requests/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEventsRequestsBottomSheet extends StatefulWidget {
  const AdminEventsRequestsBottomSheet({super.key});

  @override
  State<AdminEventsRequestsBottomSheet> createState() =>
      _AdminEventsRequestsBottomSheetState();
}

class _AdminEventsRequestsBottomSheetState
    extends State<AdminEventsRequestsBottomSheet>
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
      if (_tabController.index == 0) {
        // eventCubit.filterEvents(EventFilter.upcoming);
      } else {
        // eventCubit.filterEvents(EventFilter.past);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      height: MediaQuery.sizeOf(context).height * .90,
      child: DefaultTabController(
        length: 4,
        initialIndex: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: _CustomTabBar(),
            centerTitle: true,
          ),
          body: BlocProvider(
            create: (context) => AdminEventRequestCubit(),
            child: BlocConsumer<AdminEventRequestCubit, AdminEventRequestState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is EventRequestLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is EventRequestsLoaded) {
                  return ListView.builder(
                    itemCount: state.requests.length,
                    itemBuilder: (_, inx) => Text("data"),
                  );
                } else if (state is EventRequestEmpty) {
                  return Center(
                      child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text("No Requests")));
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTabBar extends StatelessWidget {
  const _CustomTabBar();

  @override
  Widget build(BuildContext context) {
    final Localization strings = Localization(context);
    return Container(
      width: double.infinity.sw,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TabBar(
        isScrollable: true,
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
        tabs: [
          "Approved",
          "Rejected",
          "Waiting",
          "Pending",
        ]
            .map((label) => Tab(
                  child: Text(
                    label,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
