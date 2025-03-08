import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_card.dart';
import 'package:eventra/features/admin/home/presentation/widget/admin_drawer.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_bottom_sheet.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
    bool _showUpcoming = true;

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
      body: Column(
        children: [
          // Button segmented control
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _showUpcoming = true),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _showUpcoming ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Text(
                          'UPCOMING',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: _showUpcoming ? Colors.blue : Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _showUpcoming = false),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: !_showUpcoming ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Text(
                          'PAST EVENTS',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: !_showUpcoming ? Colors.blue : Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      Expanded(
        child: BlocConsumer<EventCubit, EventState>(
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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Adjust number of columns as needed
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.75, // Adjust based on your card content
                ),
                itemCount: state.events.length,
                itemBuilder: (context, index) {
                  final event = state.events[index];
                  // to swipe left and right
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
            } else if (state is EventInitial) {
              return Text("safadfa");
            } else {
              return Ink.image(
                image: AssetImage(
                    'assets/images/on_boarding_images/onboarding4.gif'),
              );
            }
          },
        ),
      ),
  ]),
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
