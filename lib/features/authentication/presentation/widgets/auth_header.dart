import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/core/constants/strings_manager.dart';

class AuthenticationHeader extends StatelessWidget {
  const AuthenticationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SizedBox(
          height: 100.h,
          child: Image.asset(StringsManager.appImage)
              .animate()
              .fade(duration: const Duration(seconds: 2)),
        ),
        Center(
          child: Text(
            Localization.generalAppName,
            style: Theme.of(context).textTheme.titleLarge,
          ).animate().fade(duration: const Duration(seconds: 2)),
        ),
      ],
    );
  }
}
