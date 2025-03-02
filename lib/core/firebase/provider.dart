import 'package:eventra/core/firebase/user.dart' as MyUser;
import 'package:eventra/features/authentication/sign_in/presentation/pages/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firestore_helper.dart';

class AuthUserProvider extends ChangeNotifier{
  MyUser.User? databaseUser;
  User? fireBUser;

  setUsers (MyUser.User? dbUser, User? firebaseUser){
    databaseUser=dbUser;
    fireBUser=firebaseUser;
  }
  bool isLogged(){
    if(FirebaseAuth.instance.currentUser == null) return false;
    fireBUser=FirebaseAuth.instance.currentUser;
    return true;
  }

  Future<void>signOut(BuildContext context)async {
    databaseUser=null;
    fireBUser=null;
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, SignInPage.routeName, (route) => false);
  }
}