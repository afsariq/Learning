import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:jitsist/SplashScreen/splash1.dart';
import 'package:jitsist/SplashScreen/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
        body: Center(
          child: SpinKitRing(
            color: Colors.blue,
          ),
        ),
      );
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var email = prefs.getString('email');
  runApp(MaterialApp(
    home: email == null ? Splash() : SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
