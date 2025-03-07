import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/home/widget/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/home/widget/event_card.dart';
import 'package:eventra/features/admin/home/widget/event_bottom_sheet.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
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
          } else if (state is Eventloaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              itemCount: state.events.length,
              itemBuilder: (context, index) {
                final event = state.events[index];
                // to swipe left and right
                return EventCard(
                  event: event,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      context.read<EventCubit>().deleteEvent(event);
                      // setState(() => state.events.removeAt(index));
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
