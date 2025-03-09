import 'package:eventra/features/admin/home/cubit/event_state.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_card.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EventCubit, EventState>(
        listener: (context, state) {
          if (state is EventDeleted) {
            Fluttertoast.showToast(
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_LONG,
              msg: "event deleted successfully",
            );
          } else if (state is EventError) {
            Fluttertoast.showToast(
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_LONG,
              msg: state.message,
            );
          }
        },
        builder: (context, state) {
          if (state is EventLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is EventEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/images/no_upcoming_events.png'), //todo: editing the image
                  SizedBox(height: 5.h),
                  Text(
                    'Please add an event',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            );
          } else if (state is EventLoaded) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1.5,
              ),
              itemCount: state.events.length,
              itemBuilder: (context, index) {
                final event = state.events[index];

                // to swipe left and right
                return EventCard(
                  event: event,
                  isEditable: true,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      context.read<EventCubit>().deleteEvent(event);
                    }
                  },
                );
              },
            );
          } else if (state is EventError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(fontSize: 16.sp),
              ),
            );
          } else if (state is EventInitial) {
            return Text(
                "safadfa"); //todo: @jimmy is it test or we should add data here
          } else {
            return Ink.image(
              image: AssetImage(
                  'assets/images/on_boarding_images/onboarding4.gif'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (bottomCtx) => BlocProvider.value(
            value: context.read<EventCubit>(),
            child: EventBottomSheet(
              onSave: (event) => context.read<EventCubit>().addEvent(event),
            ),
          ),
        ),
        child: Icon(Icons.add, size: 25.sp),
      ),
    );
  }
}
