import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/validator/input.dart';
import 'package:eventra/core/validator/firebase.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/authentication/presentation/widgets/auth_header.dart';
import 'package:eventra/features/authentication/presentation/widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController passController;
  late TextEditingController emailController;
  late TextEditingController confirmController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    passController = TextEditingController();
    emailController = TextEditingController();
    confirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    emailController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthenticationHeader(),
            _BuildSignupForm(
              nameController: nameController,
              passController: passController,
              emailController: emailController,
              confirmController: confirmController,
            ),
            _BuildSignupAction(
                nameController: nameController,
                passController: passController,
                emailController: emailController,
                confirmController: confirmController),
          ],
        ),
      ),
    );
  }
}

class _BuildSignupForm extends StatelessWidget {
  final TextEditingController nameController,
      passController,
      emailController,
      confirmController;
  const _BuildSignupForm(
      {required this.nameController,
      required this.passController,
      required this.emailController,
      required this.confirmController});

  @override
  Widget build(BuildContext context) {
    final InputValidator validator = InputValidator(context);
    final Localization strings = Localization(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        spacing: 18.h,
        children: [
          TextInputField(
            label: strings.authInputFullName,
            controller: nameController,
            hint: strings.authInputFullName,
            validator: validator.validateName,
            icon: const Icon(Icons.person),
          ),
          TextInputField(
            label: strings.authInputEmail,
            controller: emailController,
            hint: "abc@example.com",
            validator: validator.validateEmail,
            icon: const Icon(Icons.email_outlined),
          ),
          PasswordInputField(
            hint: "123456789",
            controller: passController,
            label: strings.authInputPassword,
            validator: validator.validatePassword,
            icon: const Icon(Icons.lock_outline),
          ),
          PasswordInputField(
            hint: "123456789",
            controller: confirmController,
            label: strings.authInputConfirmPassword,
            icon: const Icon(Icons.lock_outline),
            validator: (value) =>
                validator.validateConfirmPassword(value, passController.text),
          ),
        ],
      ),
    );
  }
}

class _BuildSignupAction extends StatelessWidget {
  final TextEditingController nameController,
      passController,
      emailController,
      confirmController;
  const _BuildSignupAction(
      {required this.nameController,
      required this.passController,
      required this.emailController,
      required this.confirmController});

  @override
  Widget build(BuildContext context) {
    final strings = Localization(context);
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is UserCreated) {
          context.read<UserCubit>().setUser(state.user);
          context.goNamed(Routes.auth);
        } else if (state is AuthenticationError) {
          Fluttertoast.showToast(
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG,
            msg: FirebaseValidator(context).register(state.error),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return const CircularProgressIndicator();
        }
        return Column(
          spacing: 10.h,
          children: [
            CustomButton(
              onTap: () async {
                try {
                  await context
                      .read<AuthenticationCubit>()
                      .createUserWithEmailAndPassword(
                        User.register(
                          name: nameController.text,
                          email: emailController.text,
                        ),
                        passController.text,
                      );
                } catch (e) {
                  Fluttertoast.showToast(
                    msg: e.toString(),
                    textColor: Colors.white,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    toastLength: Toast.LENGTH_LONG,
                  );
                }
              },
              text: strings.authBtnSignUp,
            ).animate().fade(duration: const Duration(seconds: 4)),
            InkWell(
              onTap: () async {
                try {
                  context.read<AuthenticationCubit>().loginWithGoogle();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.toString()),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(StringsManager.googleImage),
                  Padding(
                    padding: REdgeInsets.only(left: 10),
                    child: Text(strings.authBtnSignInWithGoogle),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
