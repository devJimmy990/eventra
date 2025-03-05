import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/event/model/event.dart';
import 'package:eventra/features/admin/home/widget/event_card.dart';
import 'package:eventra/features/admin/home/widget/event_bottom_sheet.dart';
/**
 * 
 home screen {List<Admin-Events>, floating{BottomSheet}} {CRUD => Swipe to delete}
 * */

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final List<Event> _events = [];

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
      drawer: Drawer(),
      body: _events.isEmpty
          ? Center(
              child: Text(
                'No events added yet.',
                style: TextStyle(fontSize: 16.sp),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                // to swipe left and right
                return EventCard(
                    event: event,
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        setState(() => _events.removeAt(index));
                      }
                    });
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => EventBottomSheet(
            onSave: (event) => setState(() => _events.add(event)),
          ),
        ),
        child: Icon(Icons.add, size: 25.sp),
      ),
    );
  }
}
