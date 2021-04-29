import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsi/Payment&Booking/Booking.dart';
import 'package:jitsi/TeacherProfile/Teaherpro.dart';

class ALmaths extends StatefulWidget {
  @override
  _ALmathsState createState() => _ALmathsState();
}

class _ALmathsState extends State<ALmaths> {
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
                .collection("Teacher")
                .where('Class', isEqualTo: '6-9')
                .where('Subject', isEqualTo: 'maths')
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
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(children: [
                        Column(children: [
                          Row(children: [
                            Image.network(
                              docReference['Image'],
                              width: 150,
                              height: 150,
                            ),
                            Column(
                              children: [
                                Text(
                                  docReference['Name'],
                                  style: TextStyle(fontSize: 25),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("5"),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    )
                                  ],
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Booking(
                                                  Id: id,
                                                )));
                                  },
                                  child: Text(
                                    "Select",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  shape: StadiumBorder(),
                                  color: Color(0xff00007c),
                                ),
                              ],
                            )
                          ]),
                        ]),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        )
                      ]),
                    ),
                  ),
                );
              }).toList());
            }));
  }
}
