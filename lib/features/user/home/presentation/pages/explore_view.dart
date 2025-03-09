import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/user/home/cubit/event/event_cubit.dart';
import 'package:eventra/features/user/home/cubit/event/event_state.dart';
import 'package:eventra/features/user/home/presentation/widgets/categories_widget.dart';
import 'package:eventra/features/user/home/presentation/widgets/up_coming_widget.dart';
import 'package:eventra/features/user/home/presentation/widgets/user_drawer.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()..getEvents(),
      child: Scaffold(
          drawer: UserDrawer(),
          appBar: AppBar(
            toolbarHeight: 100.h,
            backgroundColor: Colors.blueAccent.shade100,
            iconTheme: IconThemeData(color: Colors.white, size: 30),
            centerTitle: true,
            title: Text(
              "Cairo, Egypt",
              style: TextStyle(
                  shadows: [
                    Shadow(
                      offset: Offset(3, 3),
                      blurRadius: 5,
                    ),
                  ],
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            actions: [
              IconButton(
                  icon: SvgPicture.asset(StringsManager.notificationsIcon),
                  onPressed: () {})
            ],
          ),
          body: Column(
            children: [
              CategoriesWidget(),
              BlocBuilder<EventCubit, EventState>(
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
                    return UpComingWidget(events: events);
                  }
                  return Container();
                },
              )
            ],
          )),
    );
  }
}
