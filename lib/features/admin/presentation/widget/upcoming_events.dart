import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/admin/presentation/screens/event_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/cubit/event/event_cubit.dart';
import 'package:eventra/features/admin/cubit/event/event_state.dart';
import 'package:eventra/features/admin/presentation/widget/event_card.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AdminEventCubit, AdminEventState>(
        listener: (context, state) {
          if (state is EventLoaded && state.action == EventAction.delete) {
            Fluttertoast.showToast(
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_LONG,
              msg: Localization.adminEventDeletedMsg,
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
                  Image.asset('assets/images/no_upcoming_events.png'),
                  //todo: editing the image
                  SizedBox(height: 5.h),
                  Text(
                    Localization.adminEventAddMsg,
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
                      context.read<AdminEventCubit>().deleteEvent(event);
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
          } else {
            return Ink.image(
              image: AssetImage(
                  'assets/images/on_boarding_images/onboarding4.gif'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => EventDataScreen(),
          ),
        ),
        child: Icon(Icons.add, size: 25.sp),
      ),
    );
  }
}
