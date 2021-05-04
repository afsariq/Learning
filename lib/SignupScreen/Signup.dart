import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/navBar.dart';
import 'package:jitsist/LoginScreen/Login.dart';
import 'package:jitsist/OTPScreen/Otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController email = TextEditingController(),
      password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();

  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blue,
        body: Form(
      key: _key,
      child: ListView(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.amber,
                backgroundImage: AssetImage("Assets/Images/logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: RequiredValidator(errorText: "* Required"),
                  controller: username,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff00007c),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "User name",
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: (value) {
                    String patttern = r'(^[0-9]*$)';
                    RegExp regExp = new RegExp(patttern);
                    if (value.length == 0) {
                      return "Mobile is Required";
                    } else if (value.length != 10) {
                      return "Mobile number must 10 digits";
                    } else if (!regExp.hasMatch(value)) {
                      return "Mobile Number must be digits";
                    } else {
                      return null;
                    }
                  },
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff00007c),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Phone Number",
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: RequiredValidator(errorText: "* Required"),
                  controller: city,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff00007c),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "City",
                    prefixIcon: Icon(Icons.location_city),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    EmailValidator(errorText: "Enter valid email id"),
                  ]),
                  controller: email,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: RequiredValidator(errorText: "* Required"),
                  controller: password,
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
                      )),
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
                      if (_key.currentState.validate()) {
                        createuser(context);
                      } else {
                        print("error");
                      }
                    },
                    child: Text("Continue",
                        style: TextStyle(color: Colors.white, fontSize: 17))),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?  "),
                  GestureDetector(
                      child: Text(
                        "Signin",
                        style: TextStyle(color: Colors.blue[600]),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Future<void> createuser(BuildContext context) async {
    try {
      const KEY_SHOPNAME = "UserName";

      const KEY_PHONE = "Phone";
      const KEY_CITY = "City";
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      await _fireStore.collection('Students').doc(userCredential.user.uid).set({
        KEY_SHOPNAME: username.text,
        KEY_PHONE: phone.text,
        KEY_CITY: city.text,
      }).then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email.text);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyNavigationBar()));
      });

      // print("user created");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
