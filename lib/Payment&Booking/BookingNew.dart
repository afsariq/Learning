import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsist/Payment&Booking/Profile.dart';

String Field;
String Selected;

class BookClass extends StatefulWidget {
  String Id;
  String techname;
  String bookSub;

  BookClass({
    @required this.Id,
    @required this.techname,
    @required this.bookSub,
  });
  @override
  _BookClassState createState() => _BookClassState();
}

class _BookClassState extends State<BookClass> {
  String day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff00007c),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Monday'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Monday';
                    });
                  },
                ),
                if (day == 'Monday') Monday(),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Tuesday'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Tuesday';
                    });
                  },
                ),
                if (day == 'Tuesday') Tuesday(),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Wednesda'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Wednesday';
                    });
                  },
                ),
                if (day == 'Wednesday') Wednesday(),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Thursday'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Thursday';
                    });
                  },
                ),
                if (day == 'Thursday') Thursday(),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Friday'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Friday';
                    });
                  },
                ),
                if (day == 'Friday') Friday(),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Saturday'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Saturday';
                    });
                  },
                ),
                if (day == 'Saturday') Saturday(),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sunday'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Sunday';
                    });
                  },
                ),
                if (day == 'Sunday') Sunday(),
              ],
            )
          ],
        ));
  }

  Widget Monday() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher")
            .doc(widget.Id)
            .collection("ClassTimes")
            .where('id', isEqualTo: 'Monday')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Data"),
            );
            //  Center(child: LoadingFilling.square());
          }
          return SizedBox(
            height: 290,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time1'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time1';
                              Selected = docReference['Time1'];
                            });
                            print(Field);
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time1'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time2'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time2';
                              Selected = docReference['Time2'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time2'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time3'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time3';
                              Selected = docReference['Time3'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time3'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time4'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time4';
                              Selected = docReference['Time4'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time4'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      RaisedButton(
                        onPressed: () {
                          if (Selected != 'Booked') {
                            AlertDialog alert = AlertDialog(
                              title: Text(
                                  "You Selected     " + "Monday  " + Selected),
                              actions: [
                                FlatButton(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Back"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Row(
                                    children: [
                                      Text("ok"),
                                    ],
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('ClassTimes')
                                        .doc('Monday')
                                        .update({Field: 'Booked'});
                                    //////////////////////////////
                                    //  FirebaseFirestore.instance
                                    //    .collection('Teacher')
                                    //  .doc(widget.Id)
                                    //.collection('ClassTimes').doc().update(data).w

                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Monday' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,

                                      //'Link': Room
                                    });

                                    FirebaseFirestore.instance
                                        .collection('Students')
                                        .doc(
                                          FirebaseAuth.instance.currentUser.uid,
                                        )
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Monday' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub
                                    });
                                  },
                                )
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                                barrierDismissible: true);
                          } else {}
                          ;
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        color: Color(0xff00007c),
                      ),
                    ],
                  )),
                ),
              );
            }).toList()),
          );
        });
  }

  Widget Tuesday() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher")
            .doc(widget.Id)
            .collection("ClassTimes")
            .where('id', isEqualTo: 'Tuesday')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Data"),
            );
            //  Center(child: LoadingFilling.square());
          }
          return SizedBox(
            height: 290,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time1'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time1';
                              Selected = docReference['Time1'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time1'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time2'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time2';
                              Selected = docReference['Time2'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time2'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time3'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time3';
                              Selected = docReference['Time3'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time3'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time4'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time4';
                              Selected = docReference['Time4'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time4'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      RaisedButton(
                        onPressed: () {
                          if (Selected != 'Booked') {
                            AlertDialog alert = AlertDialog(
                              title: Text(
                                  "You Selected     " + "Tuesday  " + Selected),
                              actions: [
                                FlatButton(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Back"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Row(
                                    children: [
                                      Text("ok"),
                                    ],
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('ClassTimes')
                                        .doc('Tuesday')
                                        .update({Field: 'Booked'});
                                    //////////////////////////////
                                    //  FirebaseFirestore.instance
                                    //    .collection('Teacher')
                                    //  .doc(widget.Id)
                                    //.collection('ClassTimes').doc().update(data).w

                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Tuesday' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,

                                      //'Link': Room
                                    });

                                    FirebaseFirestore.instance
                                        .collection('Students')
                                        .doc(
                                          FirebaseAuth.instance.currentUser.uid,
                                        )
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Tuesday' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub
                                    });
                                  },
                                )
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                                barrierDismissible: true);
                          } else {}
                          ;
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        color: Color(0xff00007c),
                      )
                    ],
                  )),
                ),
              );
            }).toList()),
          );
        });
  }

  Widget Wednesday() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher")
            .doc(widget.Id)
            .collection("ClassTimes")
            .where('id', isEqualTo: 'Wednesday')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Data"),
            );
            //  Center(child: LoadingFilling.square());
          }
          return SizedBox(
            height: 290,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time1'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time1';
                              Selected = docReference['Time1'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time1'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time2'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time2';
                              Selected = docReference['Time2'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time2'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time3'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time3';
                              Selected = docReference['Time3'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time3'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time4'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time4';
                              Selected = docReference['Time4'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time4'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      RaisedButton(
                        onPressed: () {
                          if (Selected != 'Booked') {
                            AlertDialog alert = AlertDialog(
                              title: Text("You Selected     " +
                                  "Wednesday  " +
                                  Selected),
                              actions: [
                                FlatButton(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Back"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Row(
                                    children: [
                                      Text("ok"),
                                    ],
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('ClassTimes')
                                        .doc('Wednesday')
                                        .update({Field: 'Booked'});
                                    //////////////////////////////
                                    //  FirebaseFirestore.instance
                                    //    .collection('Teacher')
                                    //  .doc(widget.Id)
                                    //.collection('ClassTimes').doc().update(data).w

                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Wednesday' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,

                                      //'Link': Room
                                    });

                                    FirebaseFirestore.instance
                                        .collection('Students')
                                        .doc(
                                          FirebaseAuth.instance.currentUser.uid,
                                        )
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Wednesday' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub
                                    });
                                  },
                                )
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                                barrierDismissible: true);
                          } else {}
                          ;
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        color: Color(0xff00007c),
                      )
                    ],
                  )),
                ),
              );
            }).toList()),
          );
        });
  }

  Widget Thursday() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher")
            .doc(widget.Id)
            .collection("ClassTimes")
            .where('id', isEqualTo: 'Thursday')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Data"),
            );
            //  Center(child: LoadingFilling.square());
          }
          return SizedBox(
            height: 290,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time1'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time1';
                              Selected = docReference['Time1'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time1'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time2'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Selected = docReference['Time2'];
                              Field = 'Time2';
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time2'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time3'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time3';
                              Selected = docReference['Time3'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time3'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time4'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time4';
                              Selected = docReference['Time4'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time4'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      RaisedButton(
                        onPressed: () {
                          if (Selected != 'Booked') {
                            AlertDialog alert = AlertDialog(
                              title: Text("You Selected     " +
                                  "Thursday  " +
                                  Selected),
                              actions: [
                                FlatButton(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Back"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Row(
                                    children: [
                                      Text("ok"),
                                    ],
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('ClassTimes')
                                        .doc('Thursday')
                                        .update({Field: 'Booked'});
                                    //////////////////////////////
                                    //  FirebaseFirestore.instance
                                    //    .collection('Teacher')
                                    //  .doc(widget.Id)
                                    //.collection('ClassTimes').doc().update(data).w

                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Thursday' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,

                                      //'Link': Room
                                    });

                                    FirebaseFirestore.instance
                                        .collection('Students')
                                        .doc(
                                          FirebaseAuth.instance.currentUser.uid,
                                        )
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Thursday' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub
                                    });
                                  },
                                )
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                                barrierDismissible: true);
                          } else {}
                          ;
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        color: Color(0xff00007c),
                      )
                    ],
                  )),
                ),
              );
            }).toList()),
          );
        });
  }

  Widget Friday() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher")
            .doc(widget.Id)
            .collection("ClassTimes")
            .where('id', isEqualTo: 'Friday')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Data"),
            );
            //  Center(child: LoadingFilling.square());
          }
          return SizedBox(
            height: 290,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time1'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time1';
                              Selected = docReference['Time1'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time1'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time2'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time2';
                              Selected = docReference['Time2'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time2'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time3'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time3';
                              Selected = docReference['Time3'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time3'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time4'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Selected = docReference['Time4'];
                              Field = 'Time4';
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time4'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      RaisedButton(
                        onPressed: () {
                          if (Selected != 'Booked') {
                            AlertDialog alert = AlertDialog(
                              title: Text(
                                  "You Selected     " + "Friday  " + Selected),
                              actions: [
                                FlatButton(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Back"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Row(
                                    children: [
                                      Text("ok"),
                                    ],
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('ClassTimes')
                                        .doc('Friday')
                                        .update({Field: 'Booked'});
                                    //////////////////////////////
                                    //  FirebaseFirestore.instance
                                    //    .collection('Teacher')
                                    //  .doc(widget.Id)
                                    //.collection('ClassTimes').doc().update(data).w

                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Friday' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,

                                      //'Link': Room
                                    });

                                    FirebaseFirestore.instance
                                        .collection('Students')
                                        .doc(
                                          FirebaseAuth.instance.currentUser.uid,
                                        )
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Friday' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub
                                    });
                                  },
                                )
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                                barrierDismissible: true);
                          } else {}
                          ;
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        color: Color(0xff00007c),
                      )
                    ],
                  )),
                ),
              );
            }).toList()),
          );
        });
  }

  Widget Saturday() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher")
            .doc(widget.Id)
            .collection("ClassTimes")
            .where('id', isEqualTo: 'Saturday')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Data"),
            );
            //  Center(child: LoadingFilling.square());
          }
          return SizedBox(
            height: 290,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time1'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time1';
                              Selected = docReference['Time1'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time1'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time2'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time2';
                              Selected = docReference['Time2'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time2'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time3'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Selected = docReference['Time3'];
                              Field = 'Time3';
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time3'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time4'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Selected = docReference['Time4'];
                              Field = 'Time4';
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time4'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      RaisedButton(
                        onPressed: () {
                          if (Selected != 'Booked') {
                            AlertDialog alert = AlertDialog(
                              title: Text("You Selected     " +
                                  "Saturday  " +
                                  Selected),
                              actions: [
                                FlatButton(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Back"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Row(
                                    children: [
                                      Text("ok"),
                                    ],
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('ClassTimes')
                                        .doc('Saturday')
                                        .update({Field: 'Booked'});
                                    //////////////////////////////
                                    //  FirebaseFirestore.instance
                                    //    .collection('Teacher')
                                    //  .doc(widget.Id)
                                    //.collection('ClassTimes').doc().update(data).w

                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Saturday' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,

                                      //'Link': Room
                                    });

                                    FirebaseFirestore.instance
                                        .collection('Students')
                                        .doc(
                                          FirebaseAuth.instance.currentUser.uid,
                                        )
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Saturday' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub
                                    });
                                  },
                                )
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                                barrierDismissible: true);
                          } else {}
                          ;
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        color: Color(0xff00007c),
                      )
                    ],
                  )),
                ),
              );
            }).toList()),
          );
        });
  }

  Widget Sunday() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher")
            .doc(widget.Id)
            .collection("ClassTimes")
            .where('id', isEqualTo: 'Sunday')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Data"),
            );
            //  Center(child: LoadingFilling.square());
          }
          return SizedBox(
            height: 290,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time1'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time1';
                              Selected = docReference['Time1'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time1'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time2'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Selected = docReference['Time2'];
                              Field = 'Time2';
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time2'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time3'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time3';
                              Selected = docReference['Time3'];
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time3'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time4'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Selected = docReference['Time4'];
                              Field = 'Time4';
                            });
                            print(Selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time4'])),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      RaisedButton(
                        onPressed: () {
                          if (Selected != 'Booked') {
                            AlertDialog alert = AlertDialog(
                              title: Text(
                                  "You Selected     " + "Sunday  " + Selected),
                              actions: [
                                FlatButton(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Back"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Row(
                                    children: [
                                      Text("ok"),
                                    ],
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('ClassTimes')
                                        .doc('Sunday')
                                        .update({Field: 'Booked'});
                                    //////////////////////////////
                                    //  FirebaseFirestore.instance
                                    //    .collection('Teacher')
                                    //  .doc(widget.Id)
                                    //.collection('ClassTimes').doc().update(data).w

                                    FirebaseFirestore.instance
                                        .collection('Teacher')
                                        .doc(widget.Id)
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Sunday' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,

                                      //'Link': Room
                                    });

                                    FirebaseFirestore.instance
                                        .collection('Students')
                                        .doc(
                                          FirebaseAuth.instance.currentUser.uid,
                                        )
                                        .collection('Booked Classes')
                                        .doc()
                                        .set({
                                      'Time': 'Sunday' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub
                                    });
                                  },
                                )
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                                barrierDismissible: true);
                          } else {}
                          ;
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        color: Color(0xff00007c),
                      )
                    ],
                  )),
                ),
              );
            }).toList()),
          );
        });
  }
}
