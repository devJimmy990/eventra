import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    required this.hintText,
    required this.validator,
    required this.obscure,
    required this.controller,
    required this.isPass,
    required this.icon,
    super.key,
  });
  final String hintText;
  bool obscure = false;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool isPass = false;
  final Widget icon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscure,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          suffixIcon: widget.isPass
              ? IconButton(
            onPressed: () {
              widget.obscure = !widget.obscure;
              setState(() {});
            },
            icon: widget.obscure
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          )
              : null,
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}