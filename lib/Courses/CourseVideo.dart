import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/Courses/FreeClassVdo.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/VideoCall/Video.dart';
import 'package:video_player/video_player.dart';

class CourseVideo extends StatefulWidget {
  final String cid;
  final String cname;
  const CourseVideo({Key key, @required this.cid, @required this.cname})
      : super(key: key);

  @override
  _CourseVideoState createState() => _CourseVideoState();
}

class _CourseVideoState extends State<CourseVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 90),
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
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(widget.cname,
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
                .collection("Course")
                .doc(widget.cid)
                .collection("Video")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No Data"),
                );
                //  Center(child: LoadingFilling.square());
              }
              return ListView(
                  children: snapshot.data.docs.map((docReference) {
                String id = docReference.id;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FreeClassVideo(
                                      vdoLink: docReference['vidoeUrl'],
                                      title: docReference['CourseTitle'],
                                    )));
                      },
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Details : ' +
                                          docReference['CourseTitle'])
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Tap here to watch video')
                                    ]),
                              ),
                            ],
                          )),
                    ),
                  ),
                );
              }).toList());
            }));
  }
}
