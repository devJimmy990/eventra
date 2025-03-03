import 'package:eventra/core/constants/color_manager.dart';
import 'package:eventra/core/constants/regex.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/firebase/firestore_helper.dart';
import 'package:eventra/core/firebase/google_sign_in.dart';
import 'package:eventra/core/firebase/provider.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:eventra/core/constants/image_assets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/authentication/sign_in/presentation/widgets/custom_text_field.dart';
import 'package:eventra/features/authentication/sign_up/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController confirmController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                S.of(context).signUp,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ).animate().fade(duration: const Duration(seconds: 4)),
            CustomTextField(
                    hintText: S.of(context).fullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).empty;
                      }
                      return null;
                    },
                    obscure: false,
                    controller: widget.nameController,
                    isPass: false,
                    icon: const Icon(Icons.person))
                .animate()
                .slideX(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    begin: 1.0,
                    end: 0),
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
                    controller: widget.emailController,
                    isPass: false,
                    icon: const Icon(Icons.email_outlined))
                .animate()
                .slideX(
                  duration: const Duration(
                    seconds: 1,
                  ),
                ),
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
                    controller: widget.passController,
                    isPass: true,
                    icon: const Icon(Icons.lock_outline)
                    //SvgPicture.asset(ImageAssets.passIcon),
                    )
                .animate()
                .slideX(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    begin: 1.0,
                    end: 0),
            CustomTextField(
                    hintText: S.of(context).confirmPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).empty;
                      } else if (value.length < 6) {
                        return S.of(context).shortPass;
                      } else if (value != widget.passController.text) {
                        return S.of(context).passNotMatch;
                      }
                      return null;
                    },
                    obscure: true,
                    controller: widget.confirmController,
                    isPass: true,
                    icon: const Icon(Icons.lock_outline)
                    //SvgPicture.asset(ImageAssets.emailIcon),
                    )
                .animate()
                .slideX(
                  duration: const Duration(
                    seconds: 1,
                  ),
                ),
            CustomButton(
              onTap: () {
                signup(context);
              },
              text: S.of(context).signUp,
            ).animate().fade(duration: const Duration(seconds: 4)),
            SizedBox(
              height: 20.h,
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
                  Text(S.of(context).SignInWithGoogle)
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).hasAcc,
                  style: Theme.of(context).textTheme.titleSmall,
                ).animate().slideX(
                      duration: const Duration(
                        seconds: 1,
                      ),
                    ),
                TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.sLogin);
                    },
                    child: Text(
                      S.of(context).signIn,
                      style: Theme.of(context).textTheme.labelMedium,
                    )).animate().slideX(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    begin: 1.0,
                    end: 0),
              ],
            )
          ],
        ),
      ),
    );
  }

  signup(BuildContext context) async {
    print("not signed in----------------------------------");
    Lottie.asset(
      StringsManager.loadingJson,
    );
    AuthUserProvider authProvider =
        Provider.of<AuthUserProvider>(context, listen: false);
    if (widget.formKey.currentState?.validate() ?? false) {
      print("signed in-------------------------------------");
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.emailController.text.trim(),
          password: widget.passController.text,
        );
        print("fire base credentials -------------------");
        var user = FirestoreHelper.addUser(
             name: widget.nameController.text,
             email: widget.emailController.text,
             userId: credential.user!.uid);
         authProvider.setUsers(user, credential.user);
        print("${credential.user?.displayName} --------------------");
        Fluttertoast.showToast(
            msg: S.of(context).accCreated,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: ColorManager.purpleColor,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG);
        context.goNamed(Routes.sHome);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Weak password ------------------------");
          return ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(S.of(context).shortPass)));
        } else if (e.code == 'email-already-in-use') {
          print("used email ------------------------------");
          return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: Text(S.of(context).usedEmail),
          ));
        }
      } catch (e) {
        print("${e.toString()} ---------------------");
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      }
    }
  }
}
