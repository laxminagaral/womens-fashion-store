import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/firedata/authemail.dart';
import 'package:shop_app/forgetpasswordpage.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/signup_page.dart';

import 'FadeAnimation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height - 10,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login to your account",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )
                    ],
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.2,
                            Material(
                              elevation: 6,
                              borderRadius: BorderRadius.circular(28),
                              shadowColor: Colors.grey[200],
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                    hintText: "Enter your Email",
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
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide()),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1.5,
                                      spreadRadius: 0.0,
                                    )
                                  ]),
                            )),
                        SizedBox(height: 30),
                        Material(
                          elevation: 6,
                          borderRadius: BorderRadius.circular(28),
                          shadowColor: Colors.grey[200],
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 22),
                                hintText: "Enter the password",
                                suffixIcon:
                                    Icon(Icons.lock, color: Colors.grey),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
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
                          children: [
                            Checkbox(
                              value: remember,
                              activeColor: Colors.red,
                              onChanged: (value) {
                                setState(() {
                                  remember = value;
                                });
                              },
                            ),
                            Text(
                              "Remember me",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            Spacer(),
                            
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPasswordpage()));
                                },
                                                              child: Text("Forget Password?",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 15,
                                        color: Colors.black)),
                              ),
                          
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 0, left: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: MaterialButton(
                        elevation: 10,
                        minWidth: 320,
                        height: 50,
                        onPressed: () {
                          print(emailController.text);

                         logIn(
                              emailController.text, passwordController.text);

                          // if (isLogin) {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => HomeScreen()));
                          // }
                        },
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text("Or Sign Up Using",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13)),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SocalCard(
                      image: 'assets/images/google.png',
                      press: () {},
                    ),
                    SocalCard(
                      image: 'assets/images/facebookicon.png',
                      press: () {},
                    ),
                    SocalCard(
                      image: 'assets/images/tweet.png',
                      press: () {},
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: Text(
                          "Sign Up",
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
          ],
        ),
      ),
    );
  }
}

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key key,
    this.press,
    this.image,
  }) : super(key: key);
  final Function press;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: Image.asset(image),
      ),
    );
  }
}
