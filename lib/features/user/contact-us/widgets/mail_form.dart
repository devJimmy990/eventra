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
                          icon: Icons.person,
                          label: "First Name",
                          controller: fNameController,
                          validator: ContactUsValidator.validateName,
                        ),
                      ),
                      Expanded(
                        child: TextInputField(
                          icon: Icons.person,
                          label: "Last Name",
                          controller: lNameController,
                          validator: ContactUsValidator.validateName,
                        ),
                      ),
                    ],
                  ),
                  TextInputField(
                    email: true,
                    label: "Email",
                    icon: Icons.email,
                    controller: emailController,
                    validator: ContactUsValidator.validateEmail,
                  ),
                  TextInputField(
                    phone: true,
                    label: "Phone Number",
                    icon: Icons.phone_android,
                    controller: phoneController,
                    validator: ContactUsValidator.validatePhone,
                  ),
                  TextInputField(
                    maxLines: 4,
                    phone: true,
                    label: "Message",
                    controller: messageController,
                    hintText: "Type your message here",
                    validator: ContactUsValidator.validateMessage,
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
                  child: Text("Send"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
