import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/home/cubit/event_state.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_card.dart';

class PreviousEvents extends StatelessWidget {
  const PreviousEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EventCubit, EventState>(
        listener: (context, state) {
          if (state is EventError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is EventLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EventEmpty) {
            return Center(
              child: Text(
                'No past events.',
                style: TextStyle(fontSize: 16.sp),
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
                return EventCard(
                  event: event,
                  onDismissed: null,
                  isEditable: false,
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
            return Center(child: Text("No data available"));
          } else {
            return Ink.image(
              image: AssetImage(
                  'assets/images/on_boarding_images/onboarding4.gif'),
            );
          }
        },
      ),
    );
  }
}
