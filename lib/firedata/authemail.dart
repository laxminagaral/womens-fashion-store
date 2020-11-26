
import 'package:firebase_auth/firebase_auth.dart';

 FirebaseAuth firebaseAuth = FirebaseAuth.instance;  
 // idu yak andre firebase authentication du instance madkobeku modal 
 //amele use madbek ok na


 signUp(em,ps){

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


logIn(em,ps){

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
  }
} catch (e) {
  print(e);
}

}


forgotPass(em){

try {
 FirebaseAuth.instance.sendPasswordResetEmail(
    email: em,
    
  ).then((value) => {
   
  });
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
