import 'package:flutter/material.dart';
import 'package:shop_app/FadeAnimation.dart';
import 'package:shop_app/firedata/authemail.dart';
import 'package:shop_app/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool remember = false;

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
      body: SingleChildScrollView(
        child: Container(
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
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Column(
                children: <Widget>[
                  Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(28),
                    shadowColor: Colors.grey[200],
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 22),
                          hintText: "Enter your Name",
                          suffixIcon: Icon(Icons.person, color: Colors.grey),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 42, vertical: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.grey),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.grey),
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
                      controller: emailController, //controller

                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 22),
                          hintText: "Enter your Email",
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(Icons.mail, color: Colors.grey),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 42, vertical: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.grey),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.grey),
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
                      controller: passwordController, //controller

                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 22),
                          hintText: "set password",
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(Icons.lock, color: Colors.grey),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 42, vertical: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.grey),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.grey),
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
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                    if (emailController.text.length <1 &&
                        passwordController.text.length < 1) {
                      print("Empty fields");
                    } else {
                      signUp(emailController.text, passwordController.text);
                    }
                   
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
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
