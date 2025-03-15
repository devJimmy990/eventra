import 'dart:io';

import 'package:eventra/core/constants/extensions.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/landing/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/admin/data/model/base_event.dart';
import 'package:eventra/features/admin/controller/event_category_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAboutSection extends StatefulWidget {
  const ProfileAboutSection({super.key});

  @override
  State<ProfileAboutSection> createState() => _ProfileAboutSectionState();
}

class _ProfileAboutSectionState extends State<ProfileAboutSection> {
  bool isAnyUpdate = false;
  late User user;
  File? _pickedImage;
  late Localization strings;
  final List<String> interests = [];
  late EventCategoryController categoryController;
  late TextEditingController _phoneController, _nameController;

  @override
  void initState() {
    super.initState();
    strings = Localization(context);
    user = context.read<UserCubit>().user!;
    categoryController = EventCategoryController();
    _phoneController = TextEditingController(text: user.phone);
    _nameController = TextEditingController(text: user.name);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  void _checkUpdates() {
    setState(() {
      isAnyUpdate = _nameController.text != user.name ||
          _phoneController.text != user.phone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is UserImageUploaded) {
                context
                    .read<UserCubit>()
                    .updateUserProfile(data: {"avatar": state.url});
              } else if (state is UserLoaded) {
                Fluttertoast.showToast(
                  textColor: Colors.white,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  toastLength: Toast.LENGTH_LONG,
                  msg: strings.profileDataUpdated,
                );
                setState(() => _pickedImage = null);
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundImage: _pickedImage != null
                          ? FileImage(_pickedImage!)
                          : user.avatar != null
                              ? NetworkImage(user.avatar!)
                              : null,
                      child: user.avatar == null
                          ? Text(
                              user.name.abbreviate(),
                              style: TextStyle(
                                  fontSize: 22.sp, fontWeight: FontWeight.bold),
                            )
                          : null,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: _pickedImage != null
                        ? Text(strings.profileAvatarSaving)
                        : TextButton(
                            onPressed: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((image) async {
                                if (image != null) {
                                  setState(() {
                                    _pickedImage = File(image.path);
                                    context
                                        .read<UserCubit>()
                                        .uploadImage(_pickedImage!);
                                  });
                                }
                              });
                            },
                            child: Text(
                              user.avatar != null
                                  ? strings.adminProfileAvatarChange
                                  : strings.adminProfileAvatarUpload,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
          Divider(),
          Column(
            spacing: 15.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  strings.profileInfo,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              TextInputField(
                label: strings.profileInfoName,
                controller: _nameController,
                onChanged: (val) {
                  _checkUpdates();
                },
              ),
              TextInputField(
                label: strings.profileInfoPhone,
                enabled: true,
                controller: _phoneController,
                onChanged: (val) {
                  _checkUpdates();
                },
              ),
              TextInputField(
                label: strings.profileInfoEmail,
                enabled: false,
                controller: TextEditingController(text: user.email),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: null,
                      items: [
                        DropdownMenuItem(
                          value: null,
                          child: Text("Select Interest"),
                        ),
                        ...EventCategory.values
                            .map((category) => DropdownMenuItem(
                                  value: category.toString(),
                                  child: Text(category.name),
                                ))
                      ],
                      onChanged: (value) =>
                          setState(() => interests.add(value!)),
                      decoration: InputDecoration(
                          labelText: strings.profileInfoInterests,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          )),
                    ),
                    Wrap(
                      children: interests
                          .map((interest) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Chip(
                                  deleteIcon: Icon(Icons.close),
                                  onDeleted: () => setState(
                                      () => interests.remove(interest)),
                                  label: Text(interest.split(".")[1]))))
                          .toList(),
                    ),
                  ],
                ),
              ),
              if (isAnyUpdate)
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<UserCubit>().updateUserProfile(data: {
                          "name": _nameController.text,
                          "phone": _phoneController.text,
                        });
                        setState(() => isAnyUpdate = false);
                      },
                      child: Text(strings.profileSaveChanges),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
