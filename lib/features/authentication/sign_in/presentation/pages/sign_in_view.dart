import 'package:eventra/core/constants/image_assets.dart';
import 'package:eventra/core/constants/regex.dart';
import 'package:eventra/core/constants/routes.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/core/firebase/firestore_helper.dart';
import 'package:eventra/core/firebase/provider.dart';
import 'package:eventra/core/firebase/user.dart' as MyUser;
import 'package:eventra/features/authentication/sign_in/presentation/widgets/custom_dialog.dart';
import 'package:eventra/features/authentication/sign_in/presentation/widgets/custom_text_field.dart';
import 'package:eventra/features/authentication/sign_up/presentation/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool remember = false;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: widget.formKey,
        child: ListView(
          children: [
            SizedBox(
              height: 100.h,
              child: Image.asset(ImageAssets.appImage)
                  .animate()
                  .fade(duration: const Duration(seconds: 4)),
            ),
            Center(
              child: Text(
                StringsManager.appName,
                style: Theme.of(context).textTheme.titleLarge,
              ).animate().fade(duration: const Duration(seconds: 4)),
            ),
            Padding(
              padding: REdgeInsets.only(top: 25, left: 25),
              child: Text(
                StringsManager.signIn,
                style: Theme.of(context).textTheme.titleMedium,
              ).animate().fade(duration: const Duration(seconds: 4)),
            ),
            CustomTextField(
                    hintText: StringsManager.emailEx,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringsManager.empty;
                      } else if (!emailValid(value)) {
                        return StringsManager.invalidEmail;
                      }
                      return null;
                    },
                    obscure: false,
                    controller: widget.emailController, //fix
                    isPass: false,
                    icon: const Icon(Icons.email_outlined)
                    //SvgPicture.asset(ImageAssets.emailIcon),
                    )
                .animate()
                .slideX(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    begin: 1.0,
                    end: 0),
            CustomTextField(
                    hintText: StringsManager.yourPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringsManager.empty;
                      } else if (value.length < 6) {
                        return StringsManager.shortPass;
                      }
                      return null;
                    },
                    obscure: true,
                    controller: widget.passController, //fix
                    isPass: true,
                    icon: const Icon(Icons.lock_outline)
                    //SvgPicture.asset(ImageAssets.passIcon),
                    )
                .animate()
                .slideX(
                  duration: const Duration(
                    seconds: 1,
                  ),
                ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      widget.remember
                          ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.remember = !widget.remember;
                                    });
                                  },
                                  icon: Icon(Icons.check_box_rounded))
                              .animate()
                              .fade(duration: const Duration(seconds: 4))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.remember = !widget.remember;
                                });
                              },
                              icon:
                                  Icon(Icons.check_box_outline_blank_rounded)),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            widget.remember = !widget.remember;
                          });
                        },
                        child: Text(
                          StringsManager.rememberPass,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ).animate().slideX(
                          duration: const Duration(
                            seconds: 1,
                          ),
                          begin: 1.0,
                          end: 0),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      StringsManager.forgetPass,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ).animate().slideX(
                        duration: const Duration(
                          seconds: 1,
                        ),
                      ),
                ],
              ),
            ),
            CustomButton(
              onTap: () {
                signIn();
              },
              text: StringsManager.signIn,
            ).animate().fade(duration: const Duration(seconds: 4)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsManager.noAcc,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.sRegister);
                    },
                    child: Text(
                      StringsManager.signUp,
                      style: Theme.of(context).textTheme.labelMedium,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  signIn() async {
    AuthUserProvider authProvider =
        Provider.of<AuthUserProvider>(context, listen: false);
    print("Firebase sign in --------------------");
    if (widget.formKey.currentState?.validate() ?? false) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: widget.emailController.text.trim(),
                password: widget.passController.text);
        print("Firebase credentials ----------------------");
        Center(
          child: Lottie.asset(
            StringsManager.loadingJson,
          ),
        );
        MyUser.User? user = await FirestoreHelper.getUser(credential.user!.uid);
        authProvider.setUsers(user, credential.user);
        Fluttertoast.showToast(msg: StringsManager.accCreated);
        context.goNamed(Routes.sHome);
      } on FirebaseAuthException catch (e) {
        print("FirebaseAuthException${e.toString()}--------------------");
        if (e.code == 'user-not-found') {
          print("user not found");
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
                onTap: () {
                  Navigator.pop(context);
                },
                content: const Text(StringsManager.noUser)),
          );
          return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(StringsManager.noUser)));
        } else if (e.code == 'wrong-password') {
          print("wrong password");
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
                onTap: () {
                  Navigator.pop(context);
                },
                content: Text(StringsManager.wrongPass)),
          );
          print("No fire base auth exception");
          print("${e.toString()}--------------------");
          return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(StringsManager.wrongPass)));
        }
      }
    }
  }
}
