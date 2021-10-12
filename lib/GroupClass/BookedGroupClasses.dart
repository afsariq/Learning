import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/HomeScreen/navBar.dart';
import 'package:jitsist/Payment&Booking/Booking.dart';
import 'package:jitsist/VideoCall/Video.dart' hide ClipPath;

class BookedGroupClass extends StatefulWidget {
  @override
  _BookedGroupClassState createState() => _BookedGroupClassState();
}

class _BookedGroupClassState extends State<BookedGroupClass> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyNavigationBar()));
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 105),
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
                    SizedBox(height: 50),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: IconButton(
                                    icon: Icon(Icons.arrow_back,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Group Classes",
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
                  .collection('Group Class')
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
                          child: GestureDetector(
                            child: Container(
                              height: 170,
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
                                            child: Text("Subject : ",
                                                style: TextStyle(
                                                    color: Colors.white))),
                                        Expanded(
                                            flex: 3,
                                            child: Text(docReference['subject'],
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
                                            child: Text("Chapter: ",
                                                style: TextStyle(
                                                    color: Colors.white))),
                                        Expanded(
                                            flex: 3,
                                            child: Text(docReference['Chapter'],
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
