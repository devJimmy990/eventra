import 'package:eventra/core/constants/image_assets.dart';
import 'package:eventra/core/constants/regex.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/core/firebase/firestore_helper.dart';
import 'package:eventra/core/firebase/google_sign_in.dart';
import 'package:eventra/core/firebase/provider.dart';
import 'package:eventra/core/firebase/user.dart' as MyUser;
import 'package:eventra/features/authentication/sign_in/presentation/widgets/custom_dialog.dart';
import 'package:eventra/features/authentication/sign_in/presentation/widgets/custom_text_field.dart';
import 'package:eventra/features/authentication/sign_up/presentation/widgets/custom_button.dart';
import 'package:eventra/generated/l10n.dart';
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
                S.of(context).appName,
                style: Theme.of(context).textTheme.titleLarge,
              ).animate().fade(duration: const Duration(seconds: 4)),
            ),
            Padding(
              padding: REdgeInsets.only(top: 25, left: 25),
              child: Text(
                S.of(context).signIn,
                style: Theme.of(context).textTheme.titleMedium,
              ).animate().fade(duration: const Duration(seconds: 4)),
            ),
            CustomTextField(
                    hintText: S.of(context).emailEx,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).empty;
                      } else if (!emailValid(value)) {
                        return S.of(context).invalidEmail;
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
                    hintText: S.of(context).yourPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).empty;
                      } else if (value.length < 6) {
                        return S.of(context).shortPass;
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
              padding: REdgeInsets.all(10),
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
                          S.of(context).rememberPass,
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
                      S.of(context).forgetPass,
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
              text: S.of(context).signIn,
            ).animate().fade(duration: const Duration(seconds: 4)),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                final user = await GoogleSignInService.signInWithGoogle();
                if (user != null) {
                  print("Google Sign-In Successful: ${user.displayName}");
                  context.goNamed(Routes.sHome);
                } else {
                  print("Google Sign-In Failed");
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageAssets.googleImage),
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
                  S.of(context).noAcc,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.sRegister);
                    },
                    child: Text(
                      S.of(context).signUp,
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
        Fluttertoast.showToast(msg: S.of(context).accCreated);
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
                content: Text(S.of(context).noUser)),
          );
          return ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(S.of(context).noUser)));
        } else if (e.code == 'wrong-password') {
          print("wrong password");
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
                onTap: () {
                  Navigator.pop(context);
                },
                content: Text(S.of(context).wrongPass)),
          );
          print("No fire base auth exception");
          print("${e.toString()}--------------------");
          return ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(S.of(context).wrongPass)));
        }
      }
    }
  }
}
