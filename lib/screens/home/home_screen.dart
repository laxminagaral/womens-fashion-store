import 'package:edge_alert/edge_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/loginpage.dart';

import 'package:shop_app/screens/home/components/body1.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Body1();
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        highlightColor: Colors.red,
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.logout,
            color: Colors.black,
          ),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            FirebaseAuth.instance.authStateChanges().listen((User user) {
              if (user == null) {
                EdgeAlert.show(context,
                    title: "Success",
                    description: 'You have Logged out Successfully!',
                    gravity: EdgeAlert.BOTTOM,
                    backgroundColor: Colors.green,
                    icon: Icons.check_circle);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                    (Route<dynamic> route) => false);
              }
            });
          },
        ),
      ],
    );
  }
}
