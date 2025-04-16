import 'package:eventra/core/constants/color_manager.dart';
import 'package:eventra/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_cubit.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_state.dart';

class EventCard extends StatelessWidget {
  final UserEvent event;
  final bool isBookmarkScreen;

  const EventCard(
      {super.key, required this.event, required this.isBookmarkScreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => context.pushNamed(UserRoutes.event, extra: event),
        child: Card(
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12.r)),
                    child: event.cover == null
                        ? Image.asset(
                            StringsManager.eventImage,
                            fit: BoxFit.cover,
                            height: 200.h,
                            width: double.infinity,
                          )
                        : Image.network(
                            event.cover!,
                            fit: BoxFit.cover,
                            height: 200.h,
                            width: double.infinity,
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // color: ColorManager.sideBarLight,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                event.schedule.date.day.toString(),
                                style: TextStyle(color: ColorManager.white,
                                  fontSize: 18,fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.r,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                event.schedule.date.encodeMonth(),
                                style: TextStyle(color: ColorManager.white,
                                  fontSize: 14,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.r,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!isBookmarkScreen)
                          BlocBuilder<BookmarkCubit, BookmarkState>(
                            builder: (context, state) {
                              bool isBookmarked = false;
                              if (state is BookmarkLoaded) {
                                isBookmarked = state.events.any((e) {
                                  return e.id == event.id;
                                });
                              }

                              return IconButton(splashColor: Colors.white,
                                icon: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 300),
                                  child: CircleAvatar(/*backgroundColor: ColorManager.sideBarLight,*/
                                    child: Icon(
                                      isBookmarked
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      key: ValueKey(isBookmarked),
                                      color: Colors.white

                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  final cubit = context.read<BookmarkCubit>();
                                  if (isBookmarked) {
                                    cubit.removeBookmarkEvent(event);
                                  } else {
                                    cubit.addBookmarkEvent(event);
                                  }
                                },
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: REdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: TextStyle(
                        shadows: [Shadow(blurRadius: 3.r)],
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      event.location.address,
                      style: TextStyle(
                        color: Colors.grey,
                        shadows: [Shadow(blurRadius: 3.r)],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
