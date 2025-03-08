import 'package:eventra/features/admin/event/extension/date_time.dart';
import 'package:eventra/features/admin/event/extension/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_bottom_sheet.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: event.cover == null
                            ? Image.asset(StringsManager.eventImage,
                                fit: BoxFit.cover)
                            : Image.network(event.cover!, fit: BoxFit.cover),
                      ),
                      Container(
                        margin:
                            EdgeInsetsDirectional.only(top: 5.h, start: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green.withAlpha(150),
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: 5.h, horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        event.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(event.schedule.date.encodeDate()), // Event schedule
                      Text(event.encodeLongTime()) // Event schedule
                      // Text(
                      //   //Todo Jimmy where is the date start end to view?
                      //   style: TextStyle(fontSize: 14.sp),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
