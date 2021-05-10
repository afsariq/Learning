import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsist/Payment&Booking/Profile.dart';

class Subject extends StatefulWidget {
  String cls;
  String sub;
  Subject({
    @required this.cls,
    @required this.sub,
  });

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
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
                .where('Class', isEqualTo: widget.cls)
                .where('Subject', isEqualTo: widget.sub)
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
                      child: Column(children: [
                        Row(children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              //  width: 110,
                              child: Image.network(
                                docReference['Image'],
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                            builder: (context) => profileScreen(
                                                  PId: id,
                                                  img: docReference['Image'],
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
                            ),
                          )
                        ]),
                      ]),
                    ),
                  ),
                );
              }).toList());
            }));
  }
}
