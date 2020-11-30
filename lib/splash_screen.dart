import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/loginpage.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/signup_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    User user = FirebaseAuth.instance.currentUser;
    print(user);
    Timer(
        Duration(seconds: 5),
        () => {
              if (user == null)
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()))
                }
              else
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()))
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/splashlogo.jpeg", height: 150),
          ],
        ),
      ),
    );
  }
}
