import 'package:flutter/material.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventBottomLocation extends StatefulWidget {
  final TextEditingController nameController, addressController, urlController;
  const EventBottomLocation({
    super.key,
    required this.urlController,
    required this.nameController,
    required this.addressController,
  });

  @override
  State<EventBottomLocation> createState() => _EventBottomLocationState();
}

class _EventBottomLocationState extends State<EventBottomLocation> {
  late bool isInEmbassy;
  @override
  void initState() {
    isInEmbassy = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shadowColor: Colors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: isInEmbassy,
                  onChanged: (value) {
                    setState(() {
                      isInEmbassy = value!;
                    });
                  },
                ),
                Text(
                  isInEmbassy
                      ? "event will be held in embassy"
                      : "event will be held in other",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            if (!isInEmbassy) ...[
              Column(
                spacing: 10.h,
                children: [
                  TextInputField(
                    label: "Area Name",
                    controller: widget.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "required";
                      }
                      return null;
                    },
                  ),
                  TextInputField(
                    label: "Address",
                    controller: widget.addressController,
                  ),
                  TextInputField(
                    label: "Google Map URL",
                    controller: widget.urlController,
                  ),
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}
