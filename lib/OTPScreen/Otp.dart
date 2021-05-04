import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:jitsist/HomeScreen/Home.dart';

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          // ignore: deprecated_member_use
          Stack(overflow: Overflow.visible, children: [
            Container(
              // child: Text("Enter OTP code"),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(50)),
              ),
            ),
            Positioned(
                bottom: 30.0,
                right: 0.0,
                left: 0.0,
                child: Center(
                    child: Text(
                  "Enter your OTP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ))),
          ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Text("OTP send to 07******67"),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      print(value);
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(20),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      inactiveColor: Colors.black,
                      activeColor: Colors.black,
                      selectedColor: Colors.black,
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Text(
                        "Didn't received the code? ",
                        style: TextStyle(
                          color: Colors.green[900],
                        ),
                      ),
                      GestureDetector(
                          child: Text(
                            " Resend",
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () async {}),
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(height: 50),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Continue',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                    color: Colors.deepPurple,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  //SizedBox(height:10)
                ]),
              ])
        ]))));
  }
}
