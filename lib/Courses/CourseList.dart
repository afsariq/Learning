import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/Courses/FreeClassVdo.dart';
import 'package:jitsist/VideoCall/Video.dart';
import 'package:video_player/video_player.dart';

class courseList extends StatefulWidget {
  const courseList({Key key}) : super(key: key);

  @override
  _courseListState createState() => _courseListState();
}

class _courseListState extends State<courseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff00007c),
          actions: [],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Course").snapshots(),
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
                              color: Colors.blueAccent,
                              //   border: Border.all(color: Colors.blueAccent)
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(docReference['imageUrl']),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Course Name :',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            docReference['CourseName'],
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(children: [
                                      Expanded(
                                        child: Text(
                                          'Course Fee :',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          docReference['CourseFee'],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    // ignore: deprecated_member_use
                                    child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            //   border: Border.all(color: Colors.blueAccent)
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FreeClassVideo(
                                                          vdoLink: docReference[
                                                              'videoUrl'],
                                                          title: 'Intro',
                                                        )));
                                          },
                                          child: Icon(Icons.videocam_sharp),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {},
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