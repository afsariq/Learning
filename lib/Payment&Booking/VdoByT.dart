import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/Courses/FreeClassVdo.dart';

class FreeClassesByt extends StatefulWidget {
  String TechId;
  FreeClassesByt({
    @required this.TechId,
  });

  @override
  _FreeClassesBytState createState() => _FreeClassesBytState();
}

class _FreeClassesBytState extends State<FreeClassesByt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text("Video Demo"),
          backgroundColor: Color(0xff00007c),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("FreeSessions")
                .where('id', isEqualTo: widget.TechId)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: SpinKitRing(
                  color: Colors.blue,
                ));
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
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent)),
                          child: Row(children: [
                            Expanded(
                              //flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(children: [
                                      Expanded(
                                        child: Text(
                                          'Details :',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          docReference['Details'],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(children: [
                                      Expanded(
                                        child: Text(
                                          'Subject :',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          docReference['Subject'],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(children: [
                                        Expanded(
                                          child: Text(
                                            'Grade :',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            docReference['Grade'],
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ]))
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FreeClassVideo(
                                              vdoLink: docReference['Url'],
                                            )));
                              },
                              color: Color(0xff00007c),
                            ),
                          ]),
                        ),
                      ]),
                    ),
                  ),
                );
              }).toList());
            }));
  }
}
