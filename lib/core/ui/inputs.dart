import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final Icon? icon;
  final String label;
  final int? maxLines;
  final String? hintText;
  final bool? email, phone, enabled;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const TextInputField({
    super.key,
    this.icon,
    this.email,
    this.phone,
    this.maxLines,
    this.validator,
    this.hintText,
    this.enabled = true,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      textAlignVertical: maxLines == null || maxLines == 1
          ? TextAlignVertical.center
          : TextAlignVertical.top,
      keyboardType: email == true
          ? TextInputType.emailAddress
          : phone == true
              ? TextInputType.phone
              : TextInputType.multiline,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: icon,
        labelText: label,
        hintText: hintText,
        fillColor: Colors.white,
        alignLabelWithHint: maxLines != null && maxLines! > 1,
        labelStyle: const TextStyle(color: Colors.black),
        border: _buildInputBorder(),
        enabledBorder: _buildInputBorder(),
        focusedBorder: _buildInputBorder(),
      ),
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final Icon? icon;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const PasswordInputField({
    super.key,
    this.icon,
    this.validator,
    required this.label,
    required this.controller,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: widget.validator,
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        filled: true,
        labelText: widget.label,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.lock),
        border: _buildInputBorder(),
        enabledBorder: _buildInputBorder(),
        focusedBorder: _buildInputBorder(),
        labelStyle: const TextStyle(color: Colors.black),
        suffixIcon: IconButton(
          icon: Icon(
            color: Colors.black,
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => setState(() => obscureText = !obscureText),
        ),
      ),
    );
  }
}

InputBorder _buildInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.transparent),
    );
