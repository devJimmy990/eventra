import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:eventra/core/validator/contact.dart';
import 'package:eventra/core/helper/external_launcher.dart';

class ContactUsMailFormBottomSheet extends StatefulWidget {
  const ContactUsMailFormBottomSheet({super.key});

  @override
  State<ContactUsMailFormBottomSheet> createState() =>
      _ContactUsMailFormBottomSheetState();
}

class _ContactUsMailFormBottomSheetState
    extends State<ContactUsMailFormBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController fNameController;
  late TextEditingController lNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                    spacing: 40,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextInputField(
                          icon: Icon(Icons.person),
                          label: Localization.userContactFormNameFirst,
                          controller: fNameController,
                          validator: validator.validateName,
                        ),
                      ),
                      Expanded(
                        child: TextInputField(
                          icon: Icon(Icons.person),
                          label: Localization.userContactFormNameLast,
                          controller: lNameController,
                          validator: validator.validateName,
                        ),
                      ),
                    ],
                  ),
                  TextInputField(
                    email: true,
                    label: Localization.userContactFormEmail,
                    icon: Icon(Icons.email),
                    controller: emailController,
                    validator: validator.validateEmail,
                  ),
                  TextInputField(
                    phone: true,
                    label: Localization.userContactFormPhone,
                    icon: Icon(Icons.phone_android),
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
    );
  }
}
