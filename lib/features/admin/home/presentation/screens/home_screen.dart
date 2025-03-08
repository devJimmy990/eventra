import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_card.dart';
import 'package:eventra/features/admin/home/presentation/widget/admin_drawer.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_bottom_sheet.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Welcome Admin',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      drawer: AdminDrawer(),
      body: BlocConsumer<EventCubit, EventState>(
        listener: (context, state) {
          if (state is EventError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
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
              child: Text(
                'No events added yet.',
                style: TextStyle(fontSize: 16.sp),
              ),
            );
          } else if (state is EventLoaded) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust number of columns as needed
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1.5/2, // Adjust based on your card content
              ),
              itemCount: state.events.length,
              itemBuilder: (context, index) {
                final event = state.events[index];
                return EventCard(
                  event: event,
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
