import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/event/extension/string.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_bottom_sheet.dart';

import '../../cubit/event_cubit.dart';

class EventCard extends StatelessWidget {
  final AdminEvent event;
  final void Function(DismissDirection)? onDismissed;

  const EventCard({super.key, required this.event, required this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(event.id ?? event.title),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        child: Icon(Icons.delete, color: Colors.white, size: 30.sp),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(
                child: Text(
              'Confirm Delete',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            )),
            content: Text(
              'Are you sure you want to delete this event?',
              style: TextStyle(fontSize: 14.sp),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.green, fontSize: 14.sp),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.red, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        );
      },
      onDismissed: onDismissed,
      child: _BuildEventCard(event),
    );
  }
}

class _BuildEventCard extends StatelessWidget {
  final AdminEvent event;

  const _BuildEventCard(this.event);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 10,
          margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onLongPress: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (bottomCtx) => BlocProvider.value(
                value: context.read<EventCubit>(),
                child: EventBottomSheet(
                  event: event,
                  onSave: (updatedEvent) {
                    context.read<EventCubit>().updateEvent(updatedEvent);
                  },
                ),
              ),
            ),
            onTap: () =>
                context.pushNamed(AdminRoutes.eventDetails, extra: event),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 75.h,
                    child: Hero(
                      tag: event.id ?? event.title,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: event.cover == null || event.cover!.isEmpty
                            ? Image.asset(event.cover!, fit: BoxFit.cover)
                            : event.cover!.startsWith('/')
                                ? Image.file(File(event.cover!),
                                    fit: BoxFit.cover)
                                : Image.asset(event.cover!, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and category row
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              event.title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 2.h),
                            child: Text(
                              event.category.toString().split(".")[1],
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      // Event schedule
                      Text(
                        event.schedule.start.encodeLongTime(event.schedule.end),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(height: 5.h),
                      // Event location
                      Text(
                        event.location.name,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      // You can add extra details here, such as location or event date
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
