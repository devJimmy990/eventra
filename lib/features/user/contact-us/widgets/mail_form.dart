import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:eventra/core/validator/contact.dart';
import 'package:eventra/core/helper/external_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsMailFormBottomSheet extends StatefulWidget {
  const ContactUsMailFormBottomSheet({super.key});

  @override
  State<ContactUsMailFormBottomSheet> createState() =>
      _ContactUsMailFormBottomSheetState();
}

class _ContactUsMailFormBottomSheetState
    extends State<ContactUsMailFormBottomSheet> {
  late User user;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController fNameController;
  late TextEditingController lNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    user = context.read<UserCubit>().user!;
    fNameController = TextEditingController()
      ..text = user.name.split(" ")[0].trim();
    lNameController = TextEditingController()
      ..text = user.name.split(" ")[1].trim();
    emailController = TextEditingController()..text = user.email;
    phoneController = TextEditingController()..text = user.phone;
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ContactUsValidator validator = ContactUsValidator(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Padding(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              children: [
                Column(
                  spacing: 15,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: TextInputField(
                            label: Localization.userContactFormNameFirst,
                            controller: fNameController,
                            enabled: false,
                            validator: validator.validateName,
                          ),
                        ),
                        Expanded(
                          child: TextInputField(
                            label: Localization.userContactFormNameLast,
                            controller: lNameController,
                            enabled: false,
                            validator: validator.validateName,
                          ),
                        ),
                      ],
                    ),
                    TextInputField(
                      email: true,
                      label: Localization.userContactFormEmail,
                      controller: emailController,
                      validator: validator.validateEmail,
                    ),
                    TextInputField(
                      phone: true,
                      label: Localization.userContactFormPhone,
                      controller: phoneController,
                      validator: validator.validatePhone,
                    ),
                    TextInputField(
                      maxLines: 4,
                      phone: true,
                      label: Localization.userContactFormMessage,
                      controller: messageController,
                      hint: Localization.userContactFormMessageHint,
                      validator: validator.validateMessage,
                    ),
                  ],
                ),
                FractionallySizedBox(
                  widthFactor: .6,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ExternalLauncher.launchMail(
                          name:
                              "${fNameController.text.trim()} ${lNameController.text.trim()}",
                          email: emailController.text.trim(),
                          phone: phoneController.text.trim(),
                          message: messageController.text.trim(),
                        );
                      }
                    },
                    child: Text(Localization.send),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
