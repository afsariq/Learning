import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/Payment&Booking/Profile.dart';
import 'package:jitsist/Payment&Booking/VdoByT.dart';
import 'package:jitsist/Subjects/Subjects.dart';

class SearchTeacher extends StatefulWidget {
  @override
  _SearchTeacherState createState() => _SearchTeacherState();
}

class _SearchTeacherState extends State<SearchTeacher> {
  String grade = '6-9';
  String subject = 'History';
  String _chosenValue;
  final TextEditingController searchCont = TextEditingController();
  TextEditingController _searchSubjectController = TextEditingController();
  // final _controller = ScrollController();
  Stream stream;

  @override
  void initState() {
    super.initState();
    stream = FirebaseFirestore.instance.collection("Teacher").snapshots();
    _searchSubjectController.addListener(_onSubjectChanged);
  }

  @override
  void dispose() {
    _searchSubjectController.removeListener(_onSubjectChanged);
    _searchSubjectController.dispose();
    super.dispose();
  }

  _onSubjectChanged() {
    print("----------------   " + _searchSubjectController.text);
    // stream = FirebaseFirestore.instance
    //     .collection("Teacher")
    //     .where('Class', isEqualTo: grade)
    //     .where('Subject', arrayContainsAny: [subject]).snapshots();
  }

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
                  child: Text('Search Here',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                                    grade = _chosenValue;
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
                              controller: _searchSubjectController,
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
                                  subject = _searchSubjectController.text;
                                  print('grade: ' +
                                      grade +
                                      "    subject: " +
                                      subject);
                                  // search(grade, subject);
                                });
                              }),
                        ),
                      )
                    ],
                  ),
                ), //,m,m,m,
              ],
            ),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              // .collection("Teacher")
              // .where('Class', isEqualTo: grade)
              // .where('Subject', arrayContainsAny: [subject]).snapshots(),
              .collection("Teacher")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(
                child: Center(
                    child: SpinKitRing(
                  color: Colors.blue,
                )),
              );
              //  Center(child: LoadingFilling.square());
            }
            return ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              List<String> Grade = List.from(docReference['Grade']);
              int gradeCount = Grade.length;

              List<String> Subject = List.from(docReference['Subject']);
              print('subject  ' + Subject.first + "   " + Subject.last);
              int subjectCount = Subject.length;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  //  width: 110,
                                  backgroundImage: NetworkImage(
                                    docReference['Image'],
                                  ),
                                  radius: 40,
                                  /*child: Image.network(
                                        docReference['Image'],
                                        width: 100,
                                        height: 100,
                                      ),*/
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      docReference['Name'],
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("5"),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          docReference['Medium'],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          ' Medium',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: gradeCount,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Grade : '),
                                            Text(Grade[index]),
                                          ],
                                        );
                                      },
                                    ),
                                    ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: subjectCount,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Subject : '),
                                            Text(Subject[index]),
                                          ],
                                        );
                                      },
                                    ),
                                    // //here stop

                                    /*   Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          docReference['Subject'],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(" , "),
                                        Text(
                                          docReference['Subject2'],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),*/
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          profileScreen(
                                                            PId: id,
                                                            img: docReference[
                                                                'Image'],
                                                            tname: docReference[
                                                                'Name'],
                                                            /* sub: docReference[
                                                                'Subject'],*/
                                                          )));
                                            },
                                            child: Text(
                                              "Select",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            shape: StadiumBorder(),
                                            color: Color(0xff00007c),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FreeClassesByt(
                                                            TechId: id,
                                                            Techname:
                                                                docReference[
                                                                    'Name'],
                                                          )));
                                            },
                                            child: Text(
                                              "Video",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            shape: StadiumBorder(),
                                            color: Color(0xff00007c),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            }).toList());
          }),
    );
  }
}
/*
        //   backgroundColor: Colors.blueGrey[50],
        floatingActionButton: FloatingActionButton(onPressed: () {
          final screenHeight = MediaQuery.of(context).size.height;
          _controller.jumpTo(screenHeight);

          // Otherwise use this:
          _controller.animateTo(screenHeight,
              curve: Curves.easeOut, duration: Duration(seconds: 1));
        }),
        body: SingleChildScrollView(
          controller: _controller,
          child: ListView(children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/Images/bg11.png'),
                    fit: BoxFit.cover),
                color: Color(0xff00007c),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xAA6EB1E6),
                    offset: Offset(1, 8),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                                '10-11'
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
                            controller: _searchSubjectController,
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
                                subject = _searchSubjectController.text;
                              });
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (test == 'test') GestureDetector(child: search())
          ]),
        ));
  } */

// Widget search(String grade, String subject) {
//   return SizedBox(
//     height: 2500,
//     child: Scaffold(
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection("Teacher")
//               .where('Class', isEqualTo: grade)
//               .where('Subject', isEqualTo: subject)
//               .snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return SizedBox(
//                 child: Center(
//                     child: SpinKitRing(
//                   color: Colors.blue,
//                 )),
//               );
//               //  Center(child: LoadingFilling.square());
//             }
//             return ListView(
//                 children: snapshot.data.docs.map((docReference) {
//               String id = docReference.id;
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       child: Column(children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.blue[200],
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))),
//                           child: Row(children: [
//                             Expanded(
//                               flex: 1,
//                               child: CircleAvatar(
//                                 //  width: 110,
//                                 backgroundImage: NetworkImage(
//                                   docReference['Image'],
//                                 ),
//                                 radius: 60,
//                                 /*child: Image.network(
//                                       docReference['Image'],
//                                       width: 100,
//                                       height: 100,
//                                     ),*/
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     docReference['Name'],
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("5"),
//                                       Icon(
//                                         Icons.star,
//                                         color: Colors.amber,
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         docReference['Medium'],
//                                         style: TextStyle(fontSize: 15),
//                                       ),
//                                       Text(
//                                         ' Medium',
//                                         style: TextStyle(fontSize: 15),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     docReference['Subject'],
//                                     style: TextStyle(fontSize: 15),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: RaisedButton(
//                                           onPressed: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         profileScreen(
//                                                           PId: id,
//                                                           img: docReference[
//                                                               'Image'],
//                                                           tname: docReference[
//                                                               'Name'],
//                                                           // Subject: docReference[
//                                                           //     'Subject'],
//                                                         )));
//                                           },
//                                           child: Text(
//                                             "Select",
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                           shape: StadiumBorder(),
//                                           color: Color(0xff00007c),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Expanded(
//                                         child: RaisedButton(
//                                           onPressed: () {
//                                             // Navigator.push(
//                                             //     context,
//                                             //     MaterialPageRoute(
//                                             //         builder: (context) =>
//                                             //             FreeClassesByt(
//                                             //               TechId: id,
//                                             //             )));
//                                           },
//                                           child: Text(
//                                             "Video",
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                           shape: StadiumBorder(),
//                                           color: Color(0xff00007c),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ]),
//                         ),
//                       ]),
//                     ),
//                   ),
//                 ),
//               );
//             }).toList());
//           }),
//     ),
//   );
// }
