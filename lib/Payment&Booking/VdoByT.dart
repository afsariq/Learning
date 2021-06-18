import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/Courses/FreeClassVdo.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';

class FreeClassesByt extends StatefulWidget {
  String TechId;
  String Techname;
  FreeClassesByt({
    @required this.TechId,
    @required this.Techname,
  });

  @override
  _FreeClassesBytState createState() => _FreeClassesBytState();
}

class _FreeClassesBytState extends State<FreeClassesByt> {
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
                          child: Text(widget.Techname + "'s Videos",
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
                                              title: docReference['Details'],
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
