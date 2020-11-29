import 'package:flutter/material.dart';
import 'package:shop_app/forgetpasswordpage.dart';
import 'package:shop_app/loginpage.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/signup_page.dart';
import 'package:shop_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor:Colors.lightBlue),
        
      ),
      home:LoginPage(),
    );
  }
}

