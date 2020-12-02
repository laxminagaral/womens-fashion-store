import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// idu yak andre firebase authentication du instance madkobeku modal
//amele use madbek ok na





showErrDialog(BuildContext context, String err) {
  FocusScope.of(context).requestFocus(new FocusNode());
  return showDialog(
      context: context,
      child: AlertDialog(
          title: Text('Error'),
          content: Text(err),
          actions: <Widget>[
            OutlineButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ]));
}

// ignore: missing_return
Future<User> signUp(em, ps, BuildContext context) async {
  try {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: em,
          password: ps,
        )
        .then((value) => print(value));
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'Error_Invalid_Email':
        showErrDialog(context, e.code);
        break;
      case 'Error_Wrong_Password':
        showErrDialog(context, e.code);
        break;
      case 'Error_user_not_found':
        showErrDialog(context, e.code);
        break;
    }
    return Future.value(null);
  } catch (e) {
    print(e);
  }
}

// ignore: missing_return
Future<User> logIn(em, ps, BuildContext context) async {
  try {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: em,
          password: ps,
        )
        .then((value) => {});
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'Error_Email_Already_in_use':
        showErrDialog(context, "Email Already Exits");
        break;
      case 'Invalid_Email_Address':
        showErrDialog(context, "Invalid Email Address");
        break;
      case 'Error_Weak_Paasword':
        showErrDialog(context, "Please choose a strong Password");
        break;
    }
    return Future.value(null);
  }
}

//User user=FirebaseAuth.instance.currentUser;
//if(!user.emailVerified)
