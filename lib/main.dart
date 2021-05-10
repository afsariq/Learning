import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:jitsist/SplashScreen/splash1.dart';
import 'package:jitsist/SplashScreen/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  var email = prefs.getString('email');
  runApp(MaterialApp(
    home: email == null ? Splash() : SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
