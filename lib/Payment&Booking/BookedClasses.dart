import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:jitsist/HomeScreen/navBar.dart';
import 'package:jitsist/Payment&Booking/Booking.dart';
import 'package:jitsist/VideoCall/Video.dart';

class BookedClass extends StatefulWidget {
  @override
  _BookedClassState createState() => _BookedClassState();
}

class _BookedClassState extends State<BookedClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff00007c),
          actions: [
            // IconButton(icon: Icon(Icons.chat_bubble), onPressed: () {})
          ],
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyNavigationBar()));
              }),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Students")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .collection('Booked Class')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text("Time : "),
                                        Text(docReference['Time']),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1, child: Text('Room Id : ')),
                                        Expanded(
                                            flex: 2,
                                            child: Text(docReference['Link'])),
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(
                                              icon: Icon(Icons.copy),
                                              onPressed: () {
                                                Clipboard.setData(ClipboardData(
                                                    text:
                                                        docReference['Link']));
                                              }),
                                        )
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
            }));
  }
}
