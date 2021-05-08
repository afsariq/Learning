import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  width: double.infinity,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(docReference['Time']),
                                  )),
                              SizedBox(height: 5),
                              Container(
                                  width: double.infinity,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(docReference['Link']),
                                  )),
                            ],
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
