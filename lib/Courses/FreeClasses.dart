import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/Courses/FreeClassVdo.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/VideoCall/Video.dart';
import 'package:video_player/video_player.dart';

class FreeClasses extends StatefulWidget {
  const FreeClasses({Key key}) : super(key: key);

  @override
  _FreeClassesState createState() => _FreeClassesState();
}

class _FreeClassesState extends State<FreeClasses> {
  String _chosenValue;
  final TextEditingController searchCont = TextEditingController();
  final TextEditingController searchContsub = TextEditingController();
  String grade;
  String subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 150),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Search Videos',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                                value: _chosenValue,
                                hint: Text(" Grade"),
                                items: <String>[
                                  '6-9',
                                  'A/L',
                                  'Scholorship',
                                  '10'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    _chosenValue = value;

                                    // grade = _chosenValue;
                                  });
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "    Subject",
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                              controller: searchContsub,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35))),
                          child: IconButton(
                              icon: Icon(
                                Icons.search_sharp,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                setState(() {
                                  grade = _chosenValue;
                                  subject = searchContsub.text;
                                });
                              }),
                        ),
                      )
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
                .where('Grade', isEqualTo: grade)
                .where('Subject', isEqualTo: subject)
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
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(children: [
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
                                            'Teacher Name :',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            docReference['Name'],
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.videocam,
                                          color: Colors.blue),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FreeClassVideo(
                                                      vdoLink:
                                                          docReference['Url'],
                                                      title: docReference[
                                                          'Details'],
                                                    )));
                                      },
                                      color: Color(0xff00007c),
                                    ),
                                  ],
                                ),
                              ),
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
