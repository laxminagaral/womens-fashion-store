import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/firedata/authmail.dart';
//import 'package:shop_app/firedata/authemail.dart';
import 'package:shop_app/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/screens/home/home_screen.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var _fireRef = FirebaseDatabase().reference();
  
  bool remember = false;
  String email, password, name;
  var formkey = GlobalKey<FormState>();
  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Create account",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Form(
                          key: formkey,
                          child: Column(
                            children: <Widget>[
                              Material(
                                elevation: 6,
                                borderRadius: BorderRadius.circular(28),
                                shadowColor: Colors.grey[200],
                                child: TextFormField(
                                  style: TextStyle(
                                          color:Colors.black,
                                        ),
                                  keyboardType: TextInputType.text,
                                  validator: (item) {
                                    return item.length > 0
                                        ? null
                                        : "Enter valid Name";
                                  },
                                  onChanged: (item) {
                                    setState(() {
                                      name = item;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Name",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 22),
                                      hintText: "Enter your Name",
                                      suffixIcon: Icon(Icons.person,
                                          color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 42, vertical: 20),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      )),
                                ),
                              ),
                              SizedBox(height: 30),
                              Material(
                                elevation: 6,
                                borderRadius: BorderRadius.circular(28),
                                shadowColor: Colors.grey[200],
                                child: TextFormField(
                                  style: TextStyle(
                                          color:Colors.black,
                                        ),
                                  //controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (item) {
                                    return item.contains("@")
                                        ? null
                                        : "Enter valid Email";
                                  },
                                  onChanged: (item) {
                                    setState(() {
                                      email = item;
                                    });
                                  },
                                  controller: emailController, //controller

                                  decoration: InputDecoration(
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 22),
                                      hintText: "Enter your Email",
                                      fillColor: Colors.white,
                                      filled: true,
                                      suffixIcon:
                                          Icon(Icons.mail, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 42, vertical: 20),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      )),
                                ),
                              ),
                              SizedBox(height: 30),
                              Material(
                                elevation: 6,
                                borderRadius: BorderRadius.circular(28),
                                shadowColor: Colors.grey[200],
                                child: TextFormField(
                                  style: TextStyle(
                                          color:Colors.black,
                                        ),
                                  //controller: passwordController,
                                  keyboardType: TextInputType.text,

                                  validator: (item) {
                                    return item.length > 8
                                        ? null
                                        : "Password must be 8 characters";
                                  },
                                  onChanged: (item) {
                                    setState(() {
                                      password = item;
                                    });
                                  },
                                  controller: passwordController, //controller

                                  obscureText: true,
                                  decoration: InputDecoration(
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 22),
                                      hintText: "set password",
                                      fillColor: Colors.white,
                                      filled: true,
                                      suffixIcon:
                                          Icon(Icons.lock, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 42, vertical: 20),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      )),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: remember,
                                      activeColor: Colors.red,
                                      onChanged: (value) {}),
                                  Text(
                                    "Show Password",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40),
                              Container(
                                width: double.infinity,
                                height: 50,
                                padding: EdgeInsets.only(top: 3, left: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: RaisedButton(
                                  onPressed: () {
                                    signup();

// firebaseAuth.createUserWithEmailAndPassword(email: "laxminagaral606@gmail.com", password: "12345678").then((value) => print(value));

                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) => LoginPage()));
                                  },
                                  color: Colors.red,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.only(left: 25),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "By creating an account you agree to Womens Fashion Conditions of Use and Privacy Policy.",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 90),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Already have an account?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void signup() {
    
    if (formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
            User u = FirebaseAuth.instance.currentUser;
            _fireRef.child(u.uid).push().set({
              "uid": u.uid,
              "name":name,
              "email":email
            }).then((value) => 
            Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
            (Route<dynamic> route) => false));
        
        
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "error" + onError.toString());
      });
    }
  }
}
