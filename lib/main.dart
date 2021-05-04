import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/navBar.dart';
import 'package:jitsist/LoginScreen/Login.dart';
import 'package:jitsist/Search/Search.dart';
import 'package:jitsist/VideoCall/Video.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/Home.dart';
import 'package:jitsist/HomeScreen/navBar.dart';
import 'package:jitsist/SignupScreen/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jitsist/SplashScreen/splash1.dart';
import 'package:jitsist/SplashScreen/splash.dart';
import 'package:jitsist/Subjects/Maths.dart';

import 'Subjects/6-11/maths.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  var email = prefs.getString('email');
  runApp(MaterialApp(
    home: email == null ? Splash() : SplashScreen(),
  ));
}
