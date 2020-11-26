import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/signup_page.dart';

import 'FadeAnimation.dart';

class ForgetPasswordpage extends StatefulWidget {
  @override
  _ForgetPasswordpageState createState() => _ForgetPasswordpageState();
}

class _ForgetPasswordpageState extends State<ForgetPasswordpage> {
  bool remember = false;

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
                        "Recover Password",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Enter Your Email ID to recieve Password reset link",
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
                        SizedBox(height: 5),
                       ],
                    ),
                  ),
                  SizedBox(height: 5),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "Send Link",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
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
