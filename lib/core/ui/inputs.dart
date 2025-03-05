import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? email;
  final bool? phone;
  final int? maxLines;
  final String? hintText; // New hint text parameter
final bool? enabled;
  const TextInputField({
    super.key,
    required this.label,
    required this.controller,
    this.icon,
    this.email,
    this.phone,
    this.maxLines,
    this.validator,
    this.hintText,
    this.enabled = true, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      enabled: enabled,
      
      textAlignVertical: maxLines == null || maxLines == 1
          ? TextAlignVertical.center
          : TextAlignVertical.top,
      keyboardType: email == true
          ? TextInputType.emailAddress
          : phone == true
              ? TextInputType.phone
              : TextInputType.multiline,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        alignLabelWithHint: maxLines != null &&
            maxLines! > 1, // Ensures hint starts from the top
        border: const OutlineInputBorder(),
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: icon == null ? null : Icon(icon, color: Colors.black),
      ),
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const PasswordInputField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () => setState(() => obscureText = !obscureText),
        ),
      ),
    );
  }
}
