
import 'package:firebase_auth/firebase_auth.dart';

 FirebaseAuth firebaseAuth = FirebaseAuth.instance;  
 // idu yak andre firebase authentication du instance madkobeku modal 
 //amele use madbek ok na


 signUp(e,p){

try {
 FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: e,
    password: p,
  );
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