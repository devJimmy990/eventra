import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/admin/extension/date_time.dart';
import 'package:eventra/features/admin/extension/event.dart';
import 'package:eventra/features/admin/cubit/event/event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/data/model/admin_event.dart';
import 'package:eventra/features/admin/presentation/widget/event_bottom_sheet.dart';

import '../../cubit/event/event_cubit.dart';

class EventCard extends StatelessWidget {
  final AdminEvent event;
  final void Function(DismissDirection)? onDismissed;
  final bool isEditable;

  const EventCard(
      {super.key,
      required this.event,
      required this.onDismissed,
      this.isEditable = true});

  @override
  Widget build(BuildContext context) {
    if (isEditable) {
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
        child: _BuildEventCard(event, isEditable),
      );
    } else {
      return _BuildEventCard(event, isEditable);
    }
  }
}

class _BuildEventCard extends StatelessWidget {
  final AdminEvent event;
  final bool isEditable;

  const _BuildEventCard(this.event, this.isEditable);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminEventCubit, AdminEventState>(
      builder: (context, state) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 10,
          margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onLongPress: isEditable
                ? () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (bottomCtx) => EventBottomSheet(
                          event: event,
                          onSave: (updatedEvent) => context
                              .read<AdminEventCubit>()
                              .updateEvent(updatedEvent),
                        ))
                : null,
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
                        borderRadius: BorderRadius.zero,
                        child: event.cover == null
                            ? Image.asset(StringsManager.eventImage,
                                fit: BoxFit.cover)
                            : Image.network(event.cover!, fit: BoxFit.cover),
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
                        event.schedule.date.encodeDate(),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Text(
                        event.encodeLongDateTime(),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(height: 5.h),
                      // Event location
                      Text(
                        event.location.address,
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
