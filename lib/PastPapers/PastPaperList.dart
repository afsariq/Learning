import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/Courses/FreeClassVdo.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/PastPapers/PastPapers.dart';
import 'package:jitsist/VideoCall/Video.dart' hide ClipPath;
import 'package:video_player/video_player.dart';

class PaperList extends StatefulWidget {
  const PaperList({Key key}) : super(key: key);

  @override
  _PaperListState createState() => _PaperListState();
}

class _PaperListState extends State<PaperList> {
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
                          child: Text("Past Papers",
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
            stream:
                FirebaseFirestore.instance.collection("PastPapers").snapshots(),
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyApp(pdfLink: docReference['Url'])));
                    },
                    child: Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color(0xff00007c),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Icon(Icons.picture_as_pdf,
                                    color: Colors.red)),
                            //SizedBox(width: 20),
                            Expanded(
                              child: Text(docReference['Name'],
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        )),
                  ),
                ));
              }).toList());
            }));
  }
}
