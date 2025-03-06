import 'package:eventra/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.onTap, required this.text, super.key});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorManager.buttonColor,
            gradient: LinearGradient(colors: [
              ColorManager.buttonColor,
              ColorManager.cyanColor
            ])
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}