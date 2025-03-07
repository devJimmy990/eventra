import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/event/extension/string.dart';
import 'package:eventra/features/admin/home/widget/event_bottom_sheet.dart';

import '../cubit/event_cubit.dart';

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
        child: _BuildEventCard(event));
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
          elevation: 10,
          margin: EdgeInsets.symmetric(vertical: 5.h),
          child: ListTile(
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
            leading: SizedBox(
              child: event.cover == null
                  ? Image.asset(event.cover!, fit: BoxFit.cover)
                  : event.cover!.startsWith('/')
                      ? Image.file(File(event.cover!), fit: BoxFit.cover)
                      : Image.asset(event.cover!, fit: BoxFit.cover),
            ),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.title,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      event.category.toString().split(".")[1],
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  )
                ],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.schedule.start.encodeLongTime(event.schedule.end),
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
