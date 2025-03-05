import 'package:flutter/material.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:eventra/features/admin/event/extension/string.dart';
import 'package:eventra/features/admin/home/controller/event_date_controller.dart';

class EventBottomDate extends StatefulWidget {
  final EventDateController controller;
  const EventBottomDate({super.key, required this.controller});

  @override
  State<EventBottomDate> createState() => _EventBottomDateState();
}

class _EventBottomDateState extends State<EventBottomDate> {
  late TextEditingController dateController;
  late TextEditingController startController;
  late TextEditingController endController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController()
      ..text = widget.controller.value.date.encodeDate();

    startController = TextEditingController()
      ..text = widget.controller.value.start.encodeTime();

    endController = TextEditingController()
      ..text = widget.controller.value.end.encodeTime();
  }

  @override
  void dispose() {
    endController.dispose();
    dateController.dispose();
    startController.dispose();
    super.dispose();
  }

  Future<void> showDateDialog() async {
    final List<DateTime>? dateTime = await showOmniDateTimeRangePicker(
      context: context,
      startFirstDate: DateTime.now(),
      startInitialDate: DateTime.parse(widget.controller.value.date),
      endInitialDate: DateTime.parse(widget.controller.value.end),
    );

    if (dateTime != null && dateTime.length == 2) {
      widget.controller.update = dateTime;
      setState(() {
        endController.text = widget.controller.value.end.encodeTime();
        dateController.text = widget.controller.value.date.encodeDate();
        startController.text = widget.controller.value.start.encodeTime();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shadowColor: Colors.amber,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          spacing: 20.h,
          children: [
            InkWell(
              onTap: () async => await showDateDialog(),
              child: TextInputField(
                enabled: false,
                label: "Select Date",
                controller: dateController,
              ),
            ),
            Row(
              spacing: 20.w,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async => await showDateDialog(),
                    child: TextInputField(
                      enabled: false,
                      label: "From",
                      controller: startController,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async => await showDateDialog(),
                    child: TextInputField(
                      enabled: false,
                      label: "To",
                      controller: endController,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
