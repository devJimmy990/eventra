import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/event/model/event.dart';
import 'package:eventra/features/admin/home/widget/event_bottom_date.dart';
import 'package:eventra/features/admin/home/widget/event_bottom_general.dart';
import 'package:eventra/features/admin/home/widget/event_bottom_location.dart';
import 'package:eventra/features/admin/home/controller/event_date_controller.dart';
import 'package:eventra/features/admin/home/controller/event_category_controller.dart';

class EventBottomSheet extends StatefulWidget {
  final Event? event;
  final Function(Event) onSave;
  const EventBottomSheet({
    super.key,
    this.event,
    required this.onSave,
  });

  @override
  State<EventBottomSheet> createState() => _EventBottomSheetState();
}

class _EventBottomSheetState extends State<EventBottomSheet> {
  // General Controller
  late EventCategoryController _categoryController;
  // late DateTime? initialSelectedDate;
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;

  // Date Controller {date, start, end} EventSchedule
  late EventDateController _dateController;

  // Location Controller {name, address, url}
  late TextEditingController _locationUrlController;
  late TextEditingController _locationNameController;
  late TextEditingController _locationAddressController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // General Controller
    _categoryController = EventCategoryController()
      ..value = widget.event?.category ?? EventCategory.software;

    _titleController = TextEditingController()
      ..text = widget.event?.title ?? '';

    _priceController = TextEditingController()
      ..text = widget.event?.price.toString() ?? '0';

    _descriptionController = TextEditingController()
      ..text = widget.event?.desc ?? '';
    //================================================================

    // Date Controller {date, start, end} EventSchedule
    _dateController = EventDateController(widget.event?.schedule);

    //================================================================

    // Location Controller {name, address, url}
    _locationUrlController = TextEditingController()
      ..text = widget.event?.location.url ?? "";

    _locationNameController = TextEditingController()
      ..text = widget.event?.location.url ?? "";

    _locationAddressController = TextEditingController()
      ..text = widget.event?.location.url ?? "";
    //================================================================

    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _titleController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    _locationUrlController.dispose();
    _locationNameController.dispose();
    _locationAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 10.h,
            mainAxisSize: MainAxisSize.min,
            children: [
              EventBottomGeneral(
                titleController: _titleController,
                priceController: _priceController,
                categoryController: _categoryController,
                descriptionController: _descriptionController,
              ),
              EventBottomDate(
                controller: _dateController,
              ),
              EventBottomLocation(
                urlController: _locationUrlController,
                nameController: _locationNameController,
                addressController: _locationAddressController,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSave(Event(
                      adminID: "123456789",
                      title: _titleController.text,
                      schedule: _dateController.value,
                      desc: _descriptionController.text,
                      price: int.tryParse(_priceController.text) ?? 0,
                      id: widget.event?.id ?? DateTime.now().toString(),
                      category: EventCategory.values.firstWhere((element) =>
                          element.name == _categoryController.value?.name),
                    ));
                    Navigator.pop(context);
                  }
                },
                child:
                    Text(widget.event != null ? 'Update Event' : 'Add Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
