import 'package:eventra/core/constants/extensions.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/admin/cubit/requests/request_cubit.dart';
import 'package:eventra/features/admin/cubit/requests/request_state.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  late Localization strings;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 2, length: 4, vsync: this);
    _tabController.addListener(_handleTabIndexChange);
    strings = Localization();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndexChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndexChange() {
    if (_tabController.indexIsChanging) {
      final requestCubit = context.read<AdminEventRequestCubit>();
      switch (_tabController.index) {
        case 0:
          requestCubit.filteredRequests(filter: RequestStatus.rejected);
          break;
        case 1:
          requestCubit.filteredRequests(filter: RequestStatus.approved);
          break;
        case 2:
          requestCubit.filteredRequests(filter: RequestStatus.waiting);
          break;
        case 3:
          requestCubit.filteredRequests(filter: RequestStatus.pending);
          break;
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
            title: _CustomTabBar(_tabController),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [0, 1, 2, 3]
                .map(
                  (e) => BlocConsumer<AdminEventRequestCubit,
                      AdminEventRequestState>(
                    listener: (context, state) {
                      if (state is RequestEventAccepted) {
                        Fluttertoast.showToast(
                          textColor: Colors.white,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          toastLength: Toast.LENGTH_LONG,
                          msg: Localization.adminRequestAcceptedMsg,
                        );
                      } else if (state is RequestEventRejected) {
                        Fluttertoast.showToast(
                          textColor: Colors.white,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          toastLength: Toast.LENGTH_LONG,
                          msg: Localization.adminRequestRejectedMsg,
                        );
                      } else if (state is EventRequestError) {
                        Fluttertoast.showToast(
                          textColor: Colors.white,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          toastLength: Toast.LENGTH_LONG,
                          msg: state.error,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is EventRequestLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is EventRequestsLoaded) {
                        final List<RequestEvent> requests = state.requests;
                        return ListView.builder(
                            itemCount: state.requests.length,
                            itemBuilder: (_, inx) {
                              final RequestEvent request = requests[inx];
                              return Card(
                                elevation: 10,
                                margin: EdgeInsets.all(12.h),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    radius: 35.r,
                                    backgroundImage: request.user.avatar != null
                                        ? NetworkImage(request.user.avatar!)
                                        : null,
                                    child: request.user.avatar == null
                                        ? Text(
                                            request.user.name.abbreviate(),
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : null,
                                  ),
                                  title: Text(request.eventName),
                                  subtitle: request.status ==
                                          RequestStatus.waiting
                                      ? Row(
                                          spacing: 10.w,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () => context
                                                    .read<
                                                        AdminEventRequestCubit>()
                                                    .onRejectRequest(request),
                                                child:
                                                    Text(Localization.reject)),
                                            ElevatedButton(
                                                onPressed: () => context
                                                    .read<
                                                        AdminEventRequestCubit>()
                                                    .onAcceptRequest(request),
                                                child:
                                                    Text(Localization.accept)),
                                          ],
                                        )
                                      : null,
                                ),
                              );
                            });
                      } else if (state is EventRequestEmpty) {
                        return Center(
                            child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Text(Localization.adminRequestEmpty)));
                      }
                      return SizedBox();
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _CustomTabBar extends StatelessWidget {
  final TabController controller;
  const _CustomTabBar(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.sw,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TabBar(
        controller: controller,
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
          Localization.adminRequestRejected,
          Localization.adminRequestApproved,
          Localization.adminRequestWaiting,
          Localization.adminRequestPending,
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
