import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:eventra/core/ui/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/validator/input.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:eventra/core/validator/firebase.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/authentication/controller/remember_controller.dart';
import 'package:eventra/features/authentication/presentation/widgets/auth_header.dart';
import 'package:eventra/features/authentication/presentation/widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  final void Function()? onRegister;
  const SignInScreen({super.key, required this.onRegister});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController passController;
  late TextEditingController emailController;
  late RememberController rememberController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passController = TextEditingController();
    emailController = TextEditingController();
    rememberController = RememberController();
    super.initState();
  }

  @override
  void dispose() {
    rememberController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthenticationHeader(),
          _BuildLogonForm(
            emailController: emailController,
            passwordController: passController,
            rememberController: rememberController,
          ),
          _BuildLoginActions(
              emailController: emailController,
              passwordController: passController,
              rememberController: rememberController,
              onChangeRoute: widget.onRegister),
        ],
      ),
    );
  }
}

class _BuildLogonForm extends StatelessWidget {
  final RememberController rememberController;
  final TextEditingController emailController, passwordController;

  const _BuildLogonForm({
    required this.emailController,
    required this.passwordController,
    required this.rememberController,
  });

  @override
  Widget build(BuildContext context) {
    final InputValidator validator = InputValidator(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        spacing: 18.h,
        children: [
          TextInputField(
                  label: "email",
                  hintText: S.of(context).emailEx,
                  validator: validator.validateEmpty,
                  controller: emailController,
                  icon: const Icon(Icons.email_outlined))
              .animate()
              .slideX(
                  duration: const Duration(
                    seconds: 1,
                  ),
                  begin: 1.0,
                  end: 0),
          PasswordInputField(
                  label: "password",
                  controller: passwordController,
                  validator: validator.validateEmpty,
                  icon: const Icon(Icons.lock_outline))
              .animate()
              .slideX(
                duration: const Duration(
                  seconds: 1,
                ),
              ),
          ListTile(
            horizontalTitleGap: 1.w,
            contentPadding: EdgeInsets.all(0),
            leading: Switch(
              value: rememberController.value,
              onChanged: (val) => rememberController.value = val,
            ),
            title: Text(
              S.of(context).rememberPass,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: TextButton(
              onPressed: () {},
              child: Text(
                S.of(context).forgetPass,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ).animate().slideX(
                  duration: const Duration(
                    seconds: 1,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}

class _BuildLoginActions extends StatelessWidget {
  final void Function()? onChangeRoute;
  final RememberController rememberController;
  final TextEditingController emailController, passwordController;
  const _BuildLoginActions({
    required this.emailController,
    required this.passwordController,
    required this.rememberController,
    required this.onChangeRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.read<UserCubit>().loadUser();
          context.goNamed(Routes.landing);
        } else if (state is UnAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("unauthenticated"),
            backgroundColor: Colors.red,
          ));
        } else if (state is AuthenticationError) {
          Fluttertoast.showToast(
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG,
            msg: FirebaseValidator(context).login(state.error),
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
              text: S.of(context).signIn,
              onTap: () => context
                  .read<AuthenticationCubit>()
                  .loginWithEmailAndPassword(
                      emailController.text, passwordController.text),
            ).animate().fade(duration: const Duration(seconds: 4)),
            InkWell(
              onTap: () async =>
                  context.read<AuthenticationCubit>().loginWithGoogle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(StringsManager.googleImage),
                  Padding(
                    padding: REdgeInsets.only(left: 10),
                    child: Text(S.of(context).SignInWithGoogle),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have no account?",
                ).animate().slideX(duration: const Duration(seconds: 1)),
                TextButton(
                        onPressed: onChangeRoute,
                        child: Text(
                          "create",
                        ))
                    .animate()
                    .slideX(
                        duration: const Duration(seconds: 1), begin: 1, end: 0)
              ],
            )
          ],
        );
      },
    );
  }
}
