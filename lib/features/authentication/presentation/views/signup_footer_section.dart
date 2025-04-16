import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/authentication/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupFooterSection extends StatelessWidget {
  final void Function()? onSignUpPressed, onGooglePressed;
  const SignupFooterSection(
      {super.key, this.onSignUpPressed, this.onGooglePressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onTap: onSignUpPressed,
          text: Localization.authBtnSignUp,
        ).animate().fade(duration: const Duration(seconds: 4)),
        10.verticalSpace,
        InkWell(
          onTap: onGooglePressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(StringsManager.googleImage),
              Padding(
                padding: REdgeInsets.only(left: 10),
                child: Text(Localization.authBtnSignInWithGoogle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
