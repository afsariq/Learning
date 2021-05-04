import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jitsist/LoginScreen/Login.dart';

class ForgotPassword extends StatelessWidget {
  String email = "";
  static String id = 'forgot-password';

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffccccff),
      body: Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Text(
                  'Enter the email address associated with your account',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your email";
                  } else {
                    email = value;
                  }
                  return null;
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  errorStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xff00007c),
                ),
                child: FlatButton(
                    onPressed: () {
                      if (formkey.currentState.validate()) {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email)
                            .then((value) => print("Check your mail "));
                      } else {
                        print("failure");
                      }
                    },
                    child: Text("Send Email",
                        style: TextStyle(color: Colors.white, fontSize: 17))),
              ),
              FlatButton(
                child: Text('Sign In'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
