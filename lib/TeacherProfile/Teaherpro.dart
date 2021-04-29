import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsi/Payment&Booking/Booking.dart';

class TeacherPro extends StatelessWidget {
  String Tid;
  String a = '';
  TeacherPro({
    @required this.Tid,
  });

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
                .where('id', isEqualTo: Tid)
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Row(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.network(
                                  docReference['Image'],
                                  width: 300,
                                  height: 350,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
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
                              SizedBox(
                                height: 20,
                              ),
                              Text("Class Times"),
                              Column(
                                children: [],
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
                                  "Book Class",
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: StadiumBorder(),
                                color: Color(0xff00007c),
                              )
                            ],
                          ),
                        ])),
                      ),
                    ),
                  ],
                );
              }).toList());
            }));
  }
}
