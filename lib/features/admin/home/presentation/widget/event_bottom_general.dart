import 'package:flutter/material.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/event/model/base_event.dart';
import 'package:eventra/features/admin/home/controller/event_category_controller.dart';

class EventBottomGeneral extends StatelessWidget {
  final EventCategoryController categoryController;
  final TextEditingController titleController,
      descriptionController,
      priceController;
  const EventBottomGeneral({
    super.key,
    required this.titleController,
    required this.categoryController,
    required this.descriptionController,
    required this.priceController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shadowColor: Colors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            TextInputField(
              label: "Event Title",
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required";
                }
                return null;
              },
            ),
            SizedBox(height: 10.h),
            Row(
              spacing: 20.w,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<EventCategory>(
                    value: categoryController.value,
                    items: EventCategory.values
                        .map((
                          category,
                        ) =>
                            DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            ))
                        .toList(),
                    onChanged: (value) => categoryController.value = value,
                    decoration: const InputDecoration(labelText: 'category'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextInputField(
                      label: 'Price', controller: priceController),
                )
              ],
            ),
            SizedBox(height: 10.h),
            TextInputField(
              maxLines: 3,
              label: "description",
              controller: descriptionController,
            ),
          ],
        ),
      ),
    );
  }
}
