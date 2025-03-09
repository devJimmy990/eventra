import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/admin/event/model/base_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCard extends StatelessWidget {
  EventCard({super.key, required this.event});
  BaseEvent? event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(10.0),
      child: Container(
        width: 200.w,
        margin: REdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: Image.asset(event?.cover ?? StringsManager.eventImage,
                  height: 120.h, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: REdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event?.title ?? "International Band Music Concert",
                      style: TextStyle(shadows: [
                        Shadow(
                          blurRadius: 3.r,
                        ),
                      ], fontWeight: FontWeight.bold, fontSize: 20.sp)),
                  SizedBox(height: 5.h),
                  Text(
                    event?.schedule.date.day.toString() ?? "14 December, 2021",
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 3.r,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    event?.location.address ??
                        "5 Tawfik Diab Street, Garden City",
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
    );
  }
}
