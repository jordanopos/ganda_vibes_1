import 'package:firebase_auth/firebase_auth.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ganda_vibes/src/utils/models/user.model.dart';

String? userId;

class AuthProvider {
  final _auth = FirebaseAuth.instance;

  //making a usermodel from the firebase user

  UserModel? _userfromFirebase(User? user) {
    return user != null ? UserModel.fromFirebase(user) : null;
  }

  //stream to get user value using the auth state changes
  Stream<UserModel> get user {
    return _auth.authStateChanges().map((user) => _userfromFirebase(user)!);
  }

  //login method with email and password
  Future login(String email, String password, BuildContext context) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      userId = user!.uid;

      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (error) {
      String errorText = '';
      if (error.code == 'user-not-found') {
        errorText =
            'Oops,We could not find your account using that email, Try signing up!';
      } else if (error.code == 'wrong-password') {
        errorText = 'You have provided a wrong password, Please try again!';
      } else if (error.code == 'operation-not-allowed') {
        errorText = 'Server error, Please try again';
      } else {
        errorText = error.message!;
      }
      Flushbar(
        reverseAnimationCurve: Curves.linear,
        messageSize: 17,
        icon: Icon(Icons.error),
        backgroundColor: Color(0xffB00020),
        borderRadius: BorderRadius.circular(8),
        margin: EdgeInsets.only(bottom: 8, right: 8, left: 8),
        duration: Duration(seconds: 3),
        flushbarStyle: FlushbarStyle.FLOATING,
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        message: errorText,
      ).show(context);

      return null;
    }
  }

  //sign up with email and password method or just the register method
  Future signUp(String firstName, String lastName ,String email, String password, BuildContext context) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      userId = user!.uid;
      print(userId);

      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (error) {
      String errorText = '';

      if (error.code == 'email-already-in-use') {
        errorText =
            'Oops, this email is already in use, try signing in instead!';
      } else {
        errorText = error.message!;
      }
      Flushbar(
        reverseAnimationCurve: Curves.linear,
        messageSize: 17,
        icon: Icon(Icons.error),
        backgroundColor: Color(0xffB00020),
        borderRadius: BorderRadius.circular(8),
        margin: EdgeInsets.only(bottom: 8, right: 8, left: 8),
        duration: Duration(seconds: 3),
        flushbarStyle: FlushbarStyle.FLOATING,
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        message: errorText,
      ).show(context);

      return null;
    }
  }

  // method to logout the user and stuff

  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
