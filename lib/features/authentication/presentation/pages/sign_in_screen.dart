import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/validator/input.dart';
import 'package:eventra/core/validator/firebase.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/authentication/controller/remember_controller.dart';
import 'package:eventra/features/authentication/presentation/widgets/auth_header.dart';
import 'package:eventra/features/authentication/presentation/widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late bool remember = true;
  late Localization strings;
  late InputValidator validator;
  late TextEditingController emailController;
  late RememberController rememberController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordController = TextEditingController();
    emailController = TextEditingController();
    rememberController = RememberController();
    super.initState();
    strings = Localization();
    validator = InputValidator(context);
  }

  @override
  void dispose() {
    rememberController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                spacing: 18.h,
                children: [
                  TextInputField(
                    label: Localization.authInputEmail,
                    hint: "abc@example.com",
                    validator: validator.validateEmpty,
                    controller: emailController,
                    icon: const Icon(Iconsax.sms),
                  ),
                  PasswordInputField(
                    label: Localization.authInputPassword,
                    controller: passwordController,
                    validator: validator.validateEmpty,
                    hint: "123456789",
                    icon: const Icon(Iconsax.password_check),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        horizontalTitleGap: 1.w,
                        contentPadding: EdgeInsets.all(0),
                        leading: Switch(
                          value: remember,
                          onChanged: (val) => setState(() => remember = val),
                        ),
                        title: Text(
                          Localization.authToggleRemember,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        trailing: TextButton(
                          onPressed: () {},
                          child: Text(
                            Localization.authBtnForgetPassword,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                      if (!remember)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            Localization.authRememberMsg,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationSuccess) {
                  context.read<UserCubit>().setUser(state.json);
                  context.goNamed(Routes.landing);
                } else if (state is Authenticated) {
                  context.read<AuthenticationCubit>().getUserById(state.uid);
                } else if (state is AuthenticationError) {
                  Fluttertoast.showToast(
                    textColor: Colors.white,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    toastLength: Toast.LENGTH_LONG,
                    msg: FirebaseValidator().login(state.error),
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
                        text: Localization.authBtnSignIn,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<AuthenticationCubit>()
                                .loginWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text,
                                );
                          }
                        }),
                    InkWell(
                      onTap: () async =>
                          context.read<AuthenticationCubit>().loginWithGoogle(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(StringsManager.googleImage),
                          Padding(
                            padding: REdgeInsets.only(left: 10),
                            child: Text(Localization.authBtnSignInWithGoogle),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
