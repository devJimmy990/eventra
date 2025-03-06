import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/validator/input.dart';
import 'package:eventra/core/validator/firebase.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/authentication/presentation/widgets/auth_header.dart';
import 'package:eventra/features/authentication/presentation/widgets/custom_button.dart';
import 'package:eventra/features/authentication/presentation/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
    return Form(
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
            confirmController: confirmController,
          ),
        ],
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        spacing: 18.h,
        children: [
          CustomTextField(
                  isPass: false,
                  obscure: false,
                  controller: nameController,
                  hintText: S.of(context).fullName,
                  validator: validator.validateName,
                  icon: const Icon(Icons.person))
              .animate()
              .slideX(duration: const Duration(seconds: 1), begin: 1.0, end: 0),
          CustomTextField(
            isPass: false,
            obscure: false,
            controller: emailController,
            hintText: S.of(context).emailEx,
            validator: validator.validateEmail,
            icon: const Icon(Icons.email_outlined),
          ).animate().slideX(duration: const Duration(seconds: 1)),
          CustomTextField(
            isPass: true,
            obscure: true,
            controller: passController,
            hintText: S.of(context).yourPass,
            validator: validator.validatePassword,
            icon: const Icon(Icons.lock_outline),
          )
              .animate()
              .slideX(duration: const Duration(seconds: 1), begin: 1.0, end: 0),
          CustomTextField(
            isPass: true,
            obscure: true,
            controller: confirmController,
            hintText: S.of(context).confirmPass,
            icon: const Icon(Icons.lock_outline),
            validator: (value) =>
                validator.validateConfirmPassword(value, passController.text),
          ).animate().slideX(duration: const Duration(seconds: 1)),
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
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is UserCreated) {
          context.read<UserCubit>().setUser(state.user);
          context.goNamed(UserRoutes.home);
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
                        User(
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
              text: S.of(context).signUp,
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
                    child: Text(S.of(context).SignInWithGoogle),
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

signup(BuildContext context) async {
  // print("not signed in----------------------------------");
  Lottie.asset(
    StringsManager.loadingJson,
  );
  // AuthUserProvider authProvider =
  //     Provider.of<AuthUserProvider>(context, listen: false);
  // if (formKey.currentState?.validate() ?? false) {
  //   print("signed in-------------------------------------");
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passController.text,
  //     );
  //     print("fire base credentials -------------------");
  //     var user = FirestoreHelper.addUser(
  //         name: nameController.text,
  //         email: emailController.text,
  //         userId: credential.user!.uid);
  //     authProvider.setUsers(user, credential.user);
  //     print("${credential.user?.displayName} --------------------");
  //     Fluttertoast.showToast(
  //         msg: S.of(context).accCreated,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: ColorManager.purpleColor,
  //         textColor: Colors.white,
  //         toastLength: Toast.LENGTH_LONG);
  //     context.goNamed(UserRoutes.home);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print("Weak password ------------------------");
  //       return ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(S.of(context).shortPass)));
  //     } else if (e.code == 'email-already-in-use') {
  //       print("used email ------------------------------");
  //       return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(S.of(context).usedEmail),
  //       ));
  //     }
  //   } catch (e) {
  //     print("${e.toString()} ---------------------");
  //     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(e.toString()),
  //     ));
  //   }
  // }
}
