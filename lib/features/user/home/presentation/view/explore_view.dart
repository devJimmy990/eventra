import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/user/home/cubit/event_cubit.dart';
import 'package:eventra/features/user/home/cubit/event_state.dart';
import 'package:eventra/features/user/home/presentation/widgets/event_card.dart';
class EventExploreView extends StatelessWidget {
  const EventExploreView({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0xFF4A43EC),
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          centerTitle: true,
          title: Text(
            "Cairo, Egypt",
            style: TextStyle(shadows: [
              Shadow(
                offset: Offset(3, 3),
                blurRadius: 5,
              ),
            ], fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
          actions: [
            if (context.read<UserCubit>().user != null)
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              )
          ],
        ),
        body: BlocBuilder<UserEventCubit, UserEventState>(
          builder: (context, state) {
            if (state is EventLoading) {
              return Center(
                child: Lottie.asset(StringsManager.loadingJson),
              );
            } else if (state is EventEmpty) {
              return Center(
                child: Text(S.of(context).noUpcomingEvents),
              );
            } else if (state is EventError) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is EventLoaded) {
              var events = state.events;
              return Column(
                spacing: 20.h,
                children: [
                  // TabBar(
                  //   tabs: EventCategory.values
                  //       .map((e) =>
                  //           Chip(label: Text(e.toString().split('.').last)))
                  //       .toList(),
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) =>
                          EventCard(event: events[index]),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
