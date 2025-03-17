import 'package:eventra/core/helper/localization.dart';
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
    isInEmbassy = widget.nameController.text.isEmpty ||
        widget.nameController.text.contains("U.S. Embassy Cairo");
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
                      ? Localization.adminEventHeldInEmbassy
                      : Localization.adminEventHeldOutEmbassy,
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
                    label: Localization.adminEventInputArea,
                    controller: widget.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Localization.validatorEmpty;
                      }
                      return null;
                    },
                  ),
                  TextInputField(
                    label: Localization.adminEventInputAddress,
                    controller: widget.addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Localization.validatorEmpty;
                      }
                      return null;
                    },
                  ),
                  TextInputField(
                    label: Localization.adminEventInputMap,
                    controller: widget.urlController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Localization.validatorEmpty;
                      }
                      return null;
                    },
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
