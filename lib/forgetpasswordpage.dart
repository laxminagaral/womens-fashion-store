import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/signup_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';




class ForgetPasswordpage extends StatefulWidget {
  @override
  _ForgetPasswordpageState createState() => _ForgetPasswordpageState();
}

class _ForgetPasswordpageState extends State<ForgetPasswordpage> {
  TextEditingController editController=TextEditingController();
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
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      SizedBox(height: 55),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: <Widget>[
                  
                                
                                Material(
                                  elevation: 6,
                                  borderRadius: BorderRadius.circular(28),
                                  shadowColor: Colors.grey[200],
                                  child: TextFormField(
                                    controller: editController,
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
                            
                        SizedBox(height: 15),
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
                          resetPassword(context);
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
  void resetPassword(BuildContext context) async{
    if (editController.text.length==0 || !editController.text.contains("0")) {
      Fluttertoast.showToast(msg: "enter valid email",
      textColor:Colors.white);
      return;
      
    }
    await FirebaseAuth.instance.
    sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(msg: "Reset password link has sent your mail please use it to change the password",
      textColor:Colors.white);
      Navigator.pop(context);

  }
}

