import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/Home.dart';
import 'package:jitsist/HomeScreen/navBar.dart';
import 'package:jitsist/LoginScreen/ForgotPassword.dart';
import 'package:jitsist/SignupScreen/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  SharedPreferences logindata;
  bool newuser;

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String _error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                      Container(
                        padding: EdgeInsets.only(top: 100),
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/Images/login.png"),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff00007c),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              EmailValidator(errorText: "Enter valid email id"),
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff00007c),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.fingerprint,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (_error.length > 1)
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: Container(
                            width: double.infinity,
                            height: 35,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: IconButton(
                                        iconSize: 18,
                                        icon: Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {}),
                                  ),
                                  Text(
                                    _error,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.amberAccent,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff00007c),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: MaterialButton(
                            // minWidth: double.infinity,
                            // height: 60,
                            onPressed: () {
                              if (formkey.currentState.validate()) {
                                _signin(context);
                              } else {
                                print("login failure");
                              }
                            },
                            color: Color(0xff00007c),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an Account?"),
                          GestureDetector(
                            child: Text(
                              " Sign Up",
                              style: TextStyle(
                                //  fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff00007c),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _signin(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', _email.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyNavigationBar()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for the email.');

        setState(() {
          _error = 'No user found for that email.';
        });
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');

        setState(() {
          _error = 'Wrong password provided for that user.';
        });
      }
    }
  }
}
