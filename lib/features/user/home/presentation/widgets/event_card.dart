import 'package:eventra/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/admin/data/model/base_event.dart';

class EventCard extends StatelessWidget {
  final BaseEvent event;
  const EventCard({super.key, required this.event});

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
                            color:  Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            spacing: 0,
                            children: [
                              Text(
                                event.schedule.date.day.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.r,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                event.schedule.date.encodeMonth(),
                                style: TextStyle(
                                  fontSize: 12,
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
                        CircleAvatar(
                          child: Icon(
                            Icons.bookmark_border_outlined,
                            size: 24,
                          ),
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
                    Text(event.title,
                        style: TextStyle(shadows: [
                          Shadow(
                            blurRadius: 3.r,
                          ),
                        ], fontWeight: FontWeight.bold, fontSize: 20.sp)),
                    SizedBox(height: 5.h),
                    Text(
                      event.location.address,
                      style: TextStyle(
                        color: Colors.grey,
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
            ],
          ),
        ),
      ),
    );
  }
}
