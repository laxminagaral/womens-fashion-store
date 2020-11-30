import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/loginpage.dart';
import 'package:shop_app/screens/home/components/body.dart';
import 'package:shop_app/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_app/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      if(firebaseUser==null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> SplashScreen()),(Route<dynamic>rr)=>false);
      }else{
        
      }
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(height: 55),
            ListTile(
              contentPadding: EdgeInsets.only(left: 50),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: GestureDetector(
                onTap: () async {
                  FirebaseAuth.instance.signOut().then((onvalue) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignupPage()));
                  });
                },
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 1,
      //leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
      //highlightColor: Colors.grey[300],
      //onPressed: ()=> Navigator.pop(context),
      //),
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
        SizedBox(width: 10),
      ],
    );
  }
}
