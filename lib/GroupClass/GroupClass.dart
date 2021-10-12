import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsist/GroupClass/BookedGroupClasses.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/HomeScreen/Home.dart';
import 'package:jitsist/HomeScreen/navBar.dart';
import 'package:jitsist/Payment&Booking/Checkout.dart';
import 'package:jitsist/Payment&Booking/CheckoutGroupClass.dart';
import 'package:jitsist/Payment&Booking/Profile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/Payment&Booking/VdoByT.dart';

class GroupClass extends StatefulWidget {
  //String cls;
  //String sub;
  //Subject({
  //@required this.cls,
  //@required this.sub,
  // });

  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupClass>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchCont = TextEditingController();
  String clsno;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 130),
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
                        child: Text('Group Classes',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                  hintText: "    Class Id",
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                controller: searchCont,
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
                                    clsno = searchCont.text;
                                  });
                                }),
                          ),
                        )
                      ],
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
        // get snapshots of users collections
        stream: FirebaseFirestore.instance.collection("Teacher").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center();
            // Center(child: LoadingFilling.square());
          }

          return SingleChildScrollView(
            child: Column(
              // Go through each user document
              children: snapshot.data.docs.map((docReference) {
                return StreamBuilder(
                  // get snapshots of sales collection of each user
                  stream: docReference.reference
                      .collection('Group Class')
                      .where('ClassNo', isEqualTo: clsno)
                      // .orderBy("Date", descending: true)
                      .snapshots(),
                  builder: (_, AsyncSnapshot<QuerySnapshot> collectionSnap) {
                    // display each sales data
                    return collectionSnap.hasData
                        ? Column(
                            children: collectionSnap.data.docs
                                .map((documentSnap) => _TukDataWidget(
                                    document: documentSnap,
                                    teacherName: docReference['Name']))
                                .toList(),
                          )
                        : Center(); //Text('Loading...');
                    //: CircularProgressIndicator();
                    //Center(child: LoadingFilling.square());
                    // CircularProgressIndicator();
                  },
                );
              }).toList(),
            ),
          );
          // .collection('Sale')
          // .orderBy("date", descending: true)
          // .snapshots();

          // return ListView(
          //   children: snapshot.data.docs.map((document) {
          //     return _TukDataWidget(document: document);
          //   }).toList(),
          // );
        },
      ),
    );
  }
}

/// Display Tuk data
class _TukDataWidget extends StatelessWidget {
  const _TukDataWidget({
    Key key,
    @required this.document,
    @required this.teacherName,
  }) : super(key: key);

  final QueryDocumentSnapshot document;
  final String teacherName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: double.infinity,
              //height: 150,
              decoration: BoxDecoration(
                  //color: Colors.blueAccent,
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, bottom: 25.0, left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    if (document['TeacherId'] != null) teacherPro(),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("Date : ")),
                          Expanded(child: Text(document['Date'])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("StartTime : ")),
                          Expanded(child: Text(document['StartTime'])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("EndTime : ")),
                          Expanded(child: Text(document['EndTime'])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("Joined Students : ")),
                          Expanded(
                              child:
                                  Text(document['JoinedStudents'].toString())),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("Subject : ")),
                          Expanded(child: Text(document['Subject'])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("Chapter : ")),
                          Expanded(child: Text(document['Chapter'])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("Fee : ")),
                          Expanded(child: Text(document['Fee'])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                //color: Colors.blueAccent,

                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: FlatButton(
                              // shape: StadiumBorder(),
                              child: Text("Book",
                                  style: TextStyle(color: Colors.white)),

                              onPressed: () async {
                                //check if student has already booked class

                                await FirebaseFirestore.instance
                                    .collection('Students')
                                    .doc(
                                      FirebaseAuth.instance.currentUser.uid,
                                    )
                                    .collection('Group Class')
                                    .where('Link', isEqualTo: document['Link'])
                                    .get()
                                    .then((event) {
                                  if (event.docs.isEmpty) {
                                    //can book class

                                    if (document['JoinedStudents'] !=
                                        document['MaxStudents']) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CheckoutGroupClass(
                                                    joinedStudents: document[
                                                        'JoinedStudents'],
                                                    teacherId:
                                                        document['TeacherId'],
                                                    groupClassId: document.id,
                                                    startTime:
                                                        document['StartTime'],
                                                    link: document['Link'],
                                                    chapter:
                                                        document['Chapter'],
                                                    subject:
                                                        document['Subject'],
                                                    date: document['Date'],
                                                    teacherName: teacherName,
                                                    classFee: document['Fee'],
                                                  )));
                                    } else {
                                      showAlertDialog(
                                          context,
                                          "Max no of students reached. Please try another class",
                                          "sameScreen");
                                    }
                                  } else {
                                    //cant book class more than once

                                    showAlertDialog(
                                        context,
                                        "You can book the class only once",
                                        "BookedGroupClassScreen");
                                    debugPrint('error');
                                  }
                                });
                              },
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }

  Widget teacherPro() {
    return Container(
      color: Colors.blueAccent,
      child: SizedBox(
          width: 150,
          height: 185,
          child: Scaffold(
              body: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Teacher")
                      .where('id', isEqualTo: document['TeacherId'])
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center();
                      //  Center(child: LoadingFilling.square());
                    }
                    return ListView(
                        children: snapshot.data.docs.map((docReference) {
                      String id = docReference.id;
                      return Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(docReference['Image']),
                                  fit: BoxFit.fill),
                              color: Color(0xff00007c),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Container(
                              child: Text(
                                docReference['Name'],
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      );
                    }).toList());
                  }))),
    );
  }

  showAlertDialog(BuildContext context, String message, String screen) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (screen == 'homeScreen') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyNavigationBar()));
        } else if (screen == "sameScreen") {
          Navigator.pop(context);
        } else if (screen == "BookedGroupClassScreen") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BookedGroupClass()));
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Group Class"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
