import 'dart:io';
import 'package:eventra/features/admin/home/cubit/event_state.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/event/model/base_event.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/home/controller/event_date_controller.dart';
import 'package:eventra/features/admin/home/controller/event_category_controller.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_bottom_date.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_image_picker.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_bottom_general.dart';
import 'package:eventra/features/admin/home/presentation/widget/event_bottom_location.dart';

class EventBottomSheet extends StatefulWidget {
  final AdminEvent? event;
  final Function(AdminEvent) onSave;
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
    return BlocListener<EventCubit, EventState>(
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
          /**
           * in case of add new real event, uncomment this lines to working with bottom logic of upload event cover image
           * after adding dummy events data please comment this again
           * 
           * final String uid = SharedPreference.getString(key: "uid")!;
              context.read<EventCubit>().addEvent(
                AdminEvent(
                  admin: uid,
                  cover: state.url,
                  title: _titleController.text,
                  schedule: _dateController.value,
                  desc: _descriptionController.text,
                  category: _categoryController.value!,
                  price: int.tryParse(_priceController.text) ?? 0,
                ),
              );
           */
          Fluttertoast.showToast(
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue,
            toastLength: Toast.LENGTH_LONG,
            msg: "create event",
          );
        } else if (state is EventLoaded) {
          Fluttertoast.showToast(
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            toastLength: Toast.LENGTH_LONG,
            msg:
                "event ${widget.event != null ? "updated" : "created"} successfully",
          );
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
                EventImagePicker(onImagePicked: (image) {
                  _pickImage = image;
                }),
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
                      // context
                      //     .read<EventCubit>()
                      //     .uploadImage(File(_pickImage!.path));

                      /** this  comment to reduce uploading file to storage 
                       * uncomment it when create real dummy data
                       * re-comment after creating the data 
                       * please, note that in check comments in  listener in the same page at line 101
                        final String uid =
                            SharedPreference.getString(key: "uid")!;
                        context.read<EventCubit>().addEvent(
                              AdminEvent(
                                admin: uid,
                                title: _titleController.text,
                                schedule: _dateController.value,
                                desc: _descriptionController.text,
                                category: _categoryController.value!,
                                price: int.tryParse(_priceController.text) ?? 0,
                                cover:
                                    "https://firebasestorage.googleapis.com/v0/b/eventra-1eb59.firebasestorage.app/o/events%2F1741408725868.jpg?alt=media&token=1b9ad231-b257-4fed-a14d-d90b7c52ec42",
                              ),
                            );
                      **/
                      final String uid =
                          SharedPreference.getString(key: "uid")!;
                      widget.event == null
                          ? context.read<EventCubit>().addEvent(
                                AdminEvent(
                                  admin: uid,
                                  title: _titleController.text,
                                  schedule: _dateController.value,
                                  desc: _descriptionController.text,
                                  category: _categoryController.value!,
                                  location: _locationNameController.text.isEmpty
                                      ? null
                                      : EventLocation(
                                          name: _locationNameController.text,
                                          address:
                                              _locationAddressController.text,
                                          url: _locationUrlController.text,
                                        ),
                                  price:
                                      int.tryParse(_priceController.text) ?? 0,
                                  cover:
                                      "https://firebasestorage.googleapis.com/v0/b/eventra-1eb59.firebasestorage.app/o/events%2F1741408725868.jpg?alt=media&token=1b9ad231-b257-4fed-a14d-d90b7c52ec42",
                                ),
                              )
                          : context.read<EventCubit>().updateEvent(
                                AdminEvent(
                                  admin: uid,
                                  id: widget.event!.id,
                                  title: _titleController.text,
                                  schedule: _dateController.value,
                                  desc: _descriptionController.text,
                                  category: _categoryController.value!,
                                ),
                              );
                    }
                  },
                  child:
                      Text(widget.event != null ? 'Update Event' : 'Add Event'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
