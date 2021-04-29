import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsi/LoginScreen/Login.dart';
import 'package:jitsi/Search/Search.dart';
import 'package:jitsi/VideoCall/Video.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

import 'package:flutter/material.dart';
import 'package:jitsi/HomeScreen/Home.dart';
import 'package:jitsi/HomeScreen/navBar.dart';
import 'package:jitsi/SignupScreen/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jitsi/SplashScreen/splash.dart';
import 'package:jitsi/Subjects/Maths.dart';

import 'Subjects/6-11/maths.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyNavigationBar(),
    );
  }
}
