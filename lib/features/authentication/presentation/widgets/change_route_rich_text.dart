import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Row buildChangeAuthRoute({
  required String msg,
  required String action,
  required void Function()? onPressed,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          msg,
        ).animate().slideX(
              duration: const Duration(seconds: 1),
            ),
        TextButton(
                onPressed: onPressed,
                child: Text(
                  action,
                ))
            .animate()
            .slideX(duration: const Duration(seconds: 1), begin: 1.0, end: 0),
      ],
    );
