import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/validator/firebase.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/authentication/presentation/widgets/auth_header.dart';
import 'package:eventra/features/authentication/presentation/views/signup_form_view.dart';
import 'package:eventra/features/authentication/presentation/views/signup_footer_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController passController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController confirmController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    passController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    confirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    phoneController.dispose();
    emailController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          context.read<UserCubit>().setUser(state.json);
          context.goNamed(Routes.landing);
        } else if (state is Authenticated) {
          context.read<AuthenticationCubit>().storeUserData({
            "id": state.uid,
            "name": nameController.text,
            "email": emailController.text,
            "phone": phoneController.text,
          });
          context.goNamed(Routes.landing);
        } else if (state is AuthenticationError) {
          Fluttertoast.showToast(
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG,
            msg: FirebaseValidator().register(state.error),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthenticationHeader(),
                SignupForm(
                  nameController: nameController,
                  passController: passController,
                  phoneController: phoneController,
                  emailController: emailController,
                  confirmController: confirmController,
                ),
                10.verticalSpace,
                if (state is AuthenticationLoading)
                  const CircularProgressIndicator()
                else
                  SignupFooterSection(onSignUpPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await context
                          .read<AuthenticationCubit>()
                          .createUserWithEmailAndPassword(
                            emailController.text,
                            passController.text,
                          );
                    }
                  }, onGooglePressed: () {
                    try {
                      context.read<AuthenticationCubit>().loginWithGoogle();
                    } catch (e) {
                      Fluttertoast.showToast(
                        textColor: Colors.white,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        toastLength: Toast.LENGTH_LONG,
                        msg: FirebaseValidator().login(e.toString()),
                      );
                    }
                  })
              ],
            ),
          ),
        );
      },
    );
  }
}
