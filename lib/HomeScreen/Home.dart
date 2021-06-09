import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jitsist/Courses/FreeClasses.dart';
import 'package:jitsist/Courses/FreeCourses.dart';
import 'package:jitsist/LoginScreen/Login.dart';

import 'package:jitsist/Payment&Booking/Profile.dart';
import 'package:jitsist/Profile/ProfileScreen.dart';
import 'package:jitsist/Quizz/home.dart';

import 'package:jitsist/Search/Search.dart';
import 'package:jitsist/Subjects/AL.dart';
import 'package:jitsist/Courses/Courses.dart';
import 'package:jitsist/Courses/FreeClassesList.dart';
import 'package:jitsist/Subjects/6-9.dart';
import 'package:jitsist/Subjects/10-11.dart';
import 'package:jitsist/Subjects/Subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jitsist/Payment&Booking/BookedClasses.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String data = "abcd";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xff00007c),
            actions: [],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: ListView(
                    children: [
                      Image.asset(
                        "Assets/Images/logo.png",
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff00007c),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Profile",
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => profile()));
                  },
                ),
                ListTile(
                    title: Text(
                      "LogOut",
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('email');
                      FirebaseAuth.instance.signOut().then((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      });
                    }),
              ],
            ),
          ),
          body: ListView(children: [
            SingleChildScrollView(
                child: Column(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Image.asset(
                        "Assets/Images/index.jpg",
                        width: double.infinity,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Subject(
                                                          cls: 'Scholorship',
                                                          sub: 'Scholorship',
                                                        )));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/scho.png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Scholorship",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/1 (87).png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "London A/L",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/1 (118).png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "London O/L",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  //////////////////////////////////////
                                  ///
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OLsubjects()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/1 (101).png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Grade 10-11",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ALStreams()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/1 (21).png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "A/L",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        sixtoeleven()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/1 (124).png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Grade 6-9",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CourseScreen()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/1 (122).png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Online Courses",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SearchTeacher()));
                                            //Navigator.push(
                                            // context,
                                            //PageTransition(
                                            //  type: PageTransitionType
                                            //    .leftToRightWithFade,
                                            //child: SearchTeacher()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/1 (9).png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Search",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //   context,
                                            // MaterialPageRoute(
                                            //   builder: (context) =>
                                            //     PastPapers()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/1 (110).png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Past Papers",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  const Color(0xff00007c),
                                  const Color(0xffb74093),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        // color: Colors.amberAccent,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Image.asset(
                                  "Assets/Images/quizz1.png",
                                  height: 60,
                                )),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 38.0),
                                child: Text(
                                  "Play Quiz Challange",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  homepage()));
                                    }))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  const Color(0xFF880E4F),
                                  const Color(0xFFF48FB1),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        // color: Colors.amberAccent,
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Image.asset(
                                  "Assets/Images/logo.png",
                                  width: 150,
                                  height: 180,
                                )),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FreeClasses()));
                              },
                              child: Text("Free classes"),
                              shape: StadiumBorder(),
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  const Color(0xff00007c),
                                  const Color(0xFF00CCFF),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        // color: Colors.amberAccent,
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Image.asset(
                                  "Assets/Images/phy.jpg",
                                  width: 150,
                                  height: 180,
                                )),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FreeCourses()));
                              },
                              child: Text("Free courses"),
                              shape: StadiumBorder(),
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ])
            ]))
          ])),
    );
  }
}
