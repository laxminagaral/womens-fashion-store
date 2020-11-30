import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


 FirebaseAuth firebaseAuth = FirebaseAuth.instance;  
 // idu yak andre firebase authentication du instance madkobeku modal 
 //amele use madbek ok na
 showErrDialog(BuildContext context,String err){
   FocusScope.of(context).requestFocus(new FocusNode());
   return showDialog(context: context,
   child: AlertDialog(
     title:Text('Error'),
     content:Text(err),
     actions:<Widget>[
       OutlineButton(
         onPressed: (){
           Navigator.pop(context);
         },
         child: Text('OK'),),
     ]
   ));
 } 


 // ignore: missing_return
 Future<User>signUp(em,ps,BuildContext context) async{
   

try { 
 FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: em,
    password: ps,
  ).then((value) => print(value));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}

}




// ignore: missing_return
Future<User>logIn(em,ps,BuildContext context) async{

try {
  FirebaseAuth.instance.signInWithEmailAndPassword(
    email: em,
    password: ps,
  ).then((value) => {
   
  });
} on FirebaseAuthException catch (e) { 
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }else if(e.code=='user-not-found'){
    print('No user found for that email.');
  }else if(e.code=='Wrong Password'){
    print('Wrong password provided for that user.');
  }
} catch (e) {
  print(e);
}

}


//User user=FirebaseAuth.instance.currentUser;
//if(!user.emailVerified)