import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class EventBottomSheet extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController dateController;
  final TextEditingController descriptionController;
  final TextEditingController locationNameController;
  final DateTime? initialSelectedDate;
  final String? initialCategory;
  final int? editingIndex;
  final bool initialIsInEmbassy;
  final bool Function() validateForm;
  final void Function() saveEvent;
  final String Function(DateTime) formatDate;

  const EventBottomSheet({
    super.key,
    required this.titleController,
    required this.dateController,
    required this.descriptionController,
    required this.locationNameController,
    this.initialSelectedDate,
    this.initialCategory,
    this.editingIndex,
    this.initialIsInEmbassy = false,
    required this.validateForm,
    required this.saveEvent,
    required this.formatDate,
  });

  @override
  State<EventBottomSheet> createState() => _EventBottomSheetState();
}

class _EventBottomSheetState extends State<EventBottomSheet> {
  String? _selectedCategory;
  late bool isInEmbassy;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
    isInEmbassy = widget.initialIsInEmbassy;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 20.h,
        left: 20.w,
        right: 20.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: widget.titleController,
              decoration: const InputDecoration(labelText: 'Event Title'),
            ),
            SizedBox(height: 10.h),
            // Example: Date range picker button
            ElevatedButton(
              onPressed: () async {
                final List<DateTime>? dateTime =
                    await showOmniDateTimeRangePicker(context: context);
                if (dateTime != null && dateTime.length == 2) {
                  final DateTime start = dateTime[0];
                  final DateTime end = dateTime[1];
                  // Extract the date (year, month, day) from the start DateTime.


                  debugPrint('Start: $start, End: $end, Date: $start');
                }
              },
              child: const Text('Show DateTime Picker'),
            ),

            SizedBox(height: 10.h),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: const ['software', 'hardware']
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => _selectedCategory = value),
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: widget.descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 10.h),
            Checkbox(
              value: isInEmbassy,
              onChanged: (value) {
                setState(() {
                  isInEmbassy = value!;
                });
              },
            ),
            if (!isInEmbassy)
              TextField(
                controller: widget.locationNameController,
                decoration: const InputDecoration(labelText: 'Location Link'),
              ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                if (widget.validateForm()) {
                  widget.saveEvent();
                  Navigator.pop(context);
                }
              },
              child: Text(
                  widget.editingIndex != null ? 'Update Event' : 'Add Event'),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
