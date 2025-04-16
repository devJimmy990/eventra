import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:eventra/core/validator/input.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController nameController,
      passController,
      emailController,
      phoneController,
      confirmController;
  const SignupForm(
      {super.key,
      required this.nameController,
      required this.passController,
      required this.phoneController,
      required this.emailController,
      required this.confirmController});

  @override
  Widget build(BuildContext context) {
    final InputValidator validator = InputValidator(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        spacing: 18.h,
        children: [
          TextInputField(
            label: Localization.authInputFullName,
            controller: nameController,
            hint: Localization.authInputFullName,
            validator: validator.validateName,
            icon: const Icon(Iconsax.user),
          ),
          TextInputField(
            email: true,
            label: Localization.authInputEmail,
            controller: emailController,
            hint: "abc@example.com",
            validator: validator.validateEmail,
            icon: const Icon(Iconsax.sms),
          ),
          TextInputField(
            phone: true,
            hint: "01289223643",
            controller: phoneController,
            label: Localization.authInputPhone,
            validator: validator.validatePhone,
            icon: const Icon(Iconsax.call),
          ),
          PasswordInputField(
            hint: "123456789",
            controller: passController,
            label: Localization.authInputPassword,
            validator: validator.validatePassword,
            icon: const Icon(Icons.lock_outline),
          ),
          PasswordInputField(
            hint: "123456789",
            controller: confirmController,
            label: Localization.authInputConfirmPassword,
            icon: const Icon(Icons.lock_outline),
            validator: (value) =>
                validator.validateConfirmPassword(value, passController.text),
          ),
        ],
      ),
    );
  }
}
