import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/admin/data/model/base_event.dart';
import 'package:eventra/features/admin/data/model/admin_event.dart';
import 'package:eventra/features/admin/cubit/event/event_state.dart';
import 'package:eventra/features/admin/cubit/event/event_cubit.dart';
import 'package:eventra/features/admin/controller/event_date_controller.dart';
import 'package:eventra/features/admin/controller/event_category_controller.dart';
import 'package:eventra/features/admin/presentation/view/event_data/event_bottom_date.dart';
import 'package:eventra/features/admin/presentation/view/event_data/event_image_picker.dart';
import 'package:eventra/features/admin/presentation/view/event_data/event_bottom_general.dart';
import 'package:eventra/features/admin/presentation/view/event_data/event_bottom_location.dart';

class EventDataScreen extends StatefulWidget {
  final AdminEvent? event;

  const EventDataScreen({
    super.key,
    this.event,
  });

  @override
  State<EventDataScreen> createState() => _EventDataScreenState();
}

class _EventDataScreenState extends State<EventDataScreen> {
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

  File? _pickImage;

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
      ..text = widget.event?.location.name ?? "";

    _locationAddressController = TextEditingController()
      ..text = widget.event?.location.address ?? "";
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
    return Scaffold(
      appBar: AppBar(
          title:
              Text(widget.event == null ? "Create New Event" : "Update Event")),
      body: BlocListener<AdminEventCubit, AdminEventState>(
        listener: (context, state) {
          if (state is ImageUploading) {
            Fluttertoast.showToast(
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blue,
              toastLength: Toast.LENGTH_LONG,
              msg: "upload event cover",
            );
          } else if (state is ImageUploaded) {
            context.read<AdminEventCubit>().addEvent(
                  AdminEvent(
                    admin: context.read<UserCubit>().user!,
                    cover: state.url,
                    title: _titleController.text,
                    schedule: _dateController.value,
                    desc: _descriptionController.text,
                    category: _categoryController.value!,
                    price: int.tryParse(_priceController.text) ?? 0,
                    location: _locationNameController.text.isEmpty
                        ? null
                        : EventLocation(
                            name: _locationNameController.text,
                            address: _locationAddressController.text,
                            url: _locationUrlController.text,
                          ),
                  ),
                );
          } else if (state is EventLoaded) {
            switch (state.action) {
              case EventAction.add:
                Fluttertoast.showToast(
                  textColor: Colors.white,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  toastLength: Toast.LENGTH_LONG,
                  msg: Localization.adminEventCreate,
                );
                break;
              case EventAction.update:
                Fluttertoast.showToast(
                  textColor: Colors.white,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  toastLength: Toast.LENGTH_LONG,
                  msg:Localization.adminEventUpdate,
                );
                break;
              default:
            }
            if (state.action != null) {}
            Navigator.pop(context);
          } else if (state is EventError) {
            Fluttertoast.showToast(
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_LONG,
              msg: state.message,
            );
          } else {}
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 10.h,
                mainAxisSize: MainAxisSize.min,
                children: [
                  EventImagePicker(
                    initialImage: widget.event?.cover,
                    onImagePicked: (image) {
                      _pickImage = image;
                    },
                  ),
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
                        if (widget.event == null) {
                          context
                              .read<AdminEventCubit>()
                              .uploadImage(_pickImage!);
                        } else {
                          context.read<AdminEventCubit>().updateEvent(
                                AdminEvent(
                                  id: widget.event!.id,
                                  cover: widget.event!.cover,
                                  title: _titleController.text,
                                  admin: widget.event!.admin,
                                  desc: _descriptionController.text,
                                  schedule: _dateController.value,
                                  category: _categoryController.value!,
                                  price:
                                      int.tryParse(_priceController.text) ?? 0,
                                  location: _locationNameController.text.isEmpty
                                      ? null
                                      : EventLocation(
                                          name: _locationNameController.text,
                                          address:
                                              _locationAddressController.text,
                                          url: _locationUrlController.text,
                                        ),
                                ),
                              );
                        }
                      }
                    },
                    child: Text(
                        widget.event != null ? 'Update Event' : 'Add Event'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
