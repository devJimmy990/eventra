import 'package:eventra/core/constants/color_manager.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/user/home/cubit/event_cubit.dart';
import 'package:eventra/features/user/home/cubit/event_state.dart';
import 'package:eventra/features/user/home/presentation/widgets/event_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/helper/localization.dart';

class EventExploreView extends StatefulWidget {
  const EventExploreView({super.key});

  @override
  State<EventExploreView> createState() => _EventExploreViewState();
}

class _EventExploreViewState extends State<EventExploreView> {
  late Localization strings;

  late PageController _pageController;

  final List<String> bannerImages = [
    StringsManager.bannerThree,
    StringsManager.bannerOne,
    StringsManager.bannerTwo,
  ];

  @override
  void initState() {
    super.initState();
    strings = Localization();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            // Banner Slider
            SizedBox(
              height: 200.h,
              child: PageView.builder(
                // padEnds: true ,
                controller: _pageController,
                itemCount: bannerImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        bannerImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Page Indicator
            SizedBox(height: 10.h),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: bannerImages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.blue,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),

            SizedBox(height: 20.h), // Add spacing before event list

            // Event List
            BlocBuilder<UserEventCubit, UserEventState>(
              builder: (context, state) {
                if (state is EventLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is EventEmpty) {
                  return Center(
                      child: Text(Localization.userExploreUpcomingEmpty));
                } else if (state is EventError) {
                  return Center(child: Text(state.error));
                } else if (state is EventLoaded) {
                  var events = state.events;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    // Disable ListView scrolling
                    shrinkWrap: true,
                    // Fit content inside scrollable view
                    itemCount: events.length,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    itemBuilder: (context, index) => EventCard(
                        event: events[index], isBookmarkScreen: false),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
