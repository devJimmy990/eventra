import 'package:flutter/material.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/admin/event/model/base_event.dart';
import 'package:eventra/features/admin/home/controller/event_category_controller.dart';

class ProfileAboutTab extends StatefulWidget {
  const ProfileAboutTab({super.key});

  @override
  State<ProfileAboutTab> createState() => _ProfileAboutTabState();
}

class _ProfileAboutTabState extends State<ProfileAboutTab> {
  late User user;
  final List<String> interests = [];
  late EventCategoryController categoryController;
  late TextEditingController _emailController,
      _phoneController,
      _aboutMeController;
  @override
  void initState() {
    super.initState();
    user = context.read<UserCubit>().user!;
    categoryController = EventCategoryController();
    _emailController = TextEditingController(text: user.email);
    _phoneController = TextEditingController(text: user.phone ?? "");
    _aboutMeController = TextEditingController(text: "user.aboutMe");
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    categoryController.dispose();
    _aboutMeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          spacing: 15.h,
          children: [
            TextInputField(
              label: "email",
              enabled: false,
              controller: _emailController,
            ),
            TextInputField(
              phone: true,
              label: "phone number",
              controller: _phoneController,
            ),
            TextInputField(
              phone: true,
              enabled: false,
              maxLines: 5,
              label: "about ",
              controller: _aboutMeController,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                        child: Text("select interest"),
                      ),
                      ...EventCategory.values.map((
                        category,
                      ) =>
                          DropdownMenuItem(
                            value: category.toString(),
                            child: Text(category.name),
                          ))
                    ],
                    onChanged: (value) => setState(() => interests.add(value!)),
                    decoration: InputDecoration(
                        labelText: 'interests',
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
                                onDeleted: () =>
                                    setState(() => interests.remove(interest)),
                                label: Text(interest.split(".")[1]))))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
