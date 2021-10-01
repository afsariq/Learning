import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jitsist/Courses/CourseList.dart';
import 'package:jitsist/Courses/FreeClasses.dart';
import 'package:jitsist/Courses/FreeCourses.dart';
import 'package:jitsist/HomeScreen/ComingSoon.dart';

import 'package:jitsist/LoginScreen/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsist/PastPapers/PastPaperList.dart';
import 'package:jitsist/PastPapers/PastPapers.dart';
import 'package:jitsist/Special/BookedSpClasses.dart';
import 'package:jitsist/Feedback/Feedback.dart' as f;
import 'package:jitsist/Profile/ProfileScreen.dart';
import 'package:jitsist/Quizz/home.dart';
import 'package:jitsist/Subjects/LondonAl.dart';
import 'package:jitsist/Subjects/LondonOl.dart';
import 'package:jitsist/Search/Search.dart';
import 'package:jitsist/Special/Special.dart';
import 'package:jitsist/Subjects/AL.dart';
import 'package:jitsist/Courses/Courses.dart';
import 'package:jitsist/Courses/FreeClassesList.dart';
import 'package:jitsist/Subjects/6-9.dart';
import 'package:jitsist/Subjects/10-11.dart';
import 'package:jitsist/Subjects/Subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jitsist/Payment&Booking/BookedClasses.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }

  String data = "abcd";

  String name;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
          backgroundColor: Colors.white12,
          /*appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xff00007c),
            actions: [],
          ),*/
          key: _globalKey,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('Assets/Images/vidhu.png'),
                          radius: 40),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("e-විදුහල",
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      )
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
                    "Booked Sheduled Classes",
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookedSpClass()));
                  },
                ),
                ListTile(
                    title: Text(
                      "Complaints & Feedback",
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => f.Feedback()));
                    }),
                ListTile(
                    title: Text(
                      "Logout",
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
          appBar: AppBar(
            backgroundColor: Color(0xff00007c),
            leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  _globalKey.currentState.openDrawer();
                }),
          ),
          body: ListView(children: [
            SingleChildScrollView(
                child: Column(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Container(
                          //         decoration: BoxDecoration(
                          //             color: Colors.white24,
                          //             borderRadius: BorderRadius.all(
                          //                 Radius.circular(10))),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          if (FirebaseAuth.instance.currentUser != null) Name()
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.15,
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                            image: AssetImage('Assets/Images/Header.png'),
                            fit: BoxFit.cover),
                        color: Color(0xff00007c),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        /*  boxShadow: [
                          BoxShadow(
                            color: Color(0xAA6EB1E6),
                            offset: Offset(9, 9),
                            blurRadius: 6,
                          ),
                        ],*/
                      ),
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(children: [
                            SizedBox(
                              height: 10,
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
                                                        Subject(
                                                          cls: 'Scholorship',
                                                          sub: 'Scholorship',
                                                        )));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/Schol.png"),
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
                                          onTap: () {
                                            /* Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Test()));*/
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LondonAl()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/LondonAl.png"),
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
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LondonOl()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/LondonOl.png"),
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
                                                "Assets/Images/1011.png"),
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
                                                "Assets/Images/Advanced.png"),
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
                                                "Assets/Images/0609.png"),
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
                                                        PaperList()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/Pastp.png"),
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
                                                "Assets/Images/searchAll.png"),
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

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ComingSoon()));
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "Assets/Images/sciencef.png"),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Free Classes",
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
                      height: 10,
                    ),
                    /**/
                    Row(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Special()));
                            },
                            child: Container(
                              height: 140,
                              //width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: new LinearGradient(
                                      colors: [
                                        const Color(0xff00007c),
                                        const Color(0xFF039BE5),
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              // color: Colors.amberAccent,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                            "Assets/Images/spCls.png",
                                          ))),
                                  Text("Group Classes",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => courseList()));
                            // },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ComingSoon()));
                            },
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  gradient: new LinearGradient(
                                      colors: [
                                        const Color(0xff00007c),
                                        const Color(0xFF039BE5),
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              // color: Colors.amberAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Center(
                                              child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage(
                                                    "Assets/Images/ocf.png",
                                                  )))),
                                      Text("Online Courses",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),

                                  /* RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FreeCourses()));
                                  },
                                  child: Text("Online courses"),
                                  shape: StadiumBorder(),
                                  color: Colors.white,
                                )*/
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  const Color(0xff00007c),
                                  const Color(0xFF039BE5),
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
                                child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      "Assets/Images/Quizzz.png",
                                    ))),
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
                    SizedBox(height: 20),
                  ])
            ])),
          ])),
    );
  }

  Widget Name() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Students")
            .where('Id', isEqualTo: FirebaseAuth.instance.currentUser.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Data"),
            );
            //  Center(child: LoadingFilling.square());
          }
          return SizedBox(
            height: 100,
            child: ListView(
              children: snapshot.data.docs.map((docReference) {
                String id = docReference.id;
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back ",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        )),
                    Text(
                      docReference['UserName'],
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    )
                  ],
                ));
              }).toList(),
            ),
          );
        });
  }
}
