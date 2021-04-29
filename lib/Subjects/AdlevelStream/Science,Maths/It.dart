import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ALit extends StatefulWidget {
  @override
  _ALitState createState() => _ALitState();
}

class _ALitState extends State<ALit> {
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
                .where('Subject', isEqualTo: 'ICT')
                .where('Class', isEqualTo: 'A/L')
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
                      Column(
                        children: [
                          Image.network(
                            docReference['Image'],
                            width: 150,
                            height: 150,
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
                          )
                        ],
                      ),
                    ])),
                  ),
                );
              }).toList());
            }));
  }
}
