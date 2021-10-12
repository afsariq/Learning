import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:jitsist/GroupClass/BookedGroupClasses.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/HomeScreen/navBar.dart';
import 'package:jitsist/Payment&Booking/Booking.dart';
import 'package:jitsist/VideoCall/Video.dart' hide ClipPath;

class BookedClass extends StatefulWidget {
  @override
  _BookedClassState createState() => _BookedClassState();
}

class _BookedClassState extends State<BookedClass> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
          floatingActionButton: new FloatingActionButton(
              backgroundColor: Color(0xff00007c),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookedGroupClass()));
              },
              child: Text(
                'Booked Special Classes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                ),
              )),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 65),
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/Images/bg11.png'),
                      fit: BoxFit.cover),
                  color: Color(0xff00007c),

                  /*  boxShadow: [
                          BoxShadow(
                            color: Color(0xAA6EB1E6),
                            offset: Offset(9, 9),
                            blurRadius: 6,
                          ),
                        ],*/
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Booked Classes",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Students")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .collection('Booked Classes')
                  .orderBy('Date', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("No data"),
                  );
                  //  Center(child: LoadingFilling.square());
                }
                return ListView(
                    children: snapshot.data.docs.map((docReference) {
                  String id = docReference.id;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Ticket(
                            radius: 8,
                            child: GestureDetector(
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text("Date : ",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                          Expanded(
                                              flex: 3,
                                              child: Text(docReference['Date'],
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text("Time : ",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                          Expanded(
                                              flex: 3,
                                              child: Text(docReference['Time'],
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(height: 5),

                                    //    Padding(
                                    //    padding: const EdgeInsets.all(8.0),
                                    //  child: Row(
                                    //  children: [
                                    //  Expanded(
                                    //    flex: 1, child: Text("Link : ")),
                                    //Expanded(
                                    //  flex: 3,
                                    // child:
                                    //   Text(docReference['Link'])),
                                    //],
                                    //),
                                    //),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text("Teacher Name : ",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                  docReference['Teacher'],
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text("Subject: ",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                  docReference['subject'],
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      'Tap here to attend class',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Video(
                                              Linkid: docReference['Link'],
                                            )));
                              },
                            ),
                          )),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  );
                }).toList());
              })),
    );
  }
}
