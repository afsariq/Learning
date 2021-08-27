import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/Payment&Booking/Checkout.dart';
import 'package:jitsist/Payment&Booking/Profile.dart';
import 'package:intl/intl.dart';

String Field;
String Selected;
var date = DateTime.now();
var dat = DateFormat('EEEE, d MMM, yyyy').format(date);

class BookClass extends StatefulWidget {
  String Id;
  String techname;
  String bookSub;
  String bookgrd;
  BookClass({
    @required this.Id,
    @required this.techname,
    @required this.bookSub,
    @required this.bookgrd,
  });
  @override
  _BookClassState createState() => _BookClassState();
}

class _BookClassState extends State<BookClass> {
  String day = "";

  MaterialColor conttColor = Colors.grey;
  MaterialColor conttColor1 = Colors.grey;
  MaterialColor conttColor2 = Colors.grey;
  MaterialColor conttColor3 = Colors.grey;
  MaterialColor conttColor4 = Colors.grey;
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(DateFormat('EEEE, d MMM, yyyy').format(date),
                              textAlign: TextAlign.right),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(widget.techname + "'s Shedule",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      //SizedBox(height: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color(0xff00007c),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'M',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),

                            ///backgroundColor: Colors.lightBlue,
                          )),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Monday',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))),
                          if (day == "")
                            Expanded(
                                child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )),
                          if (day == "Monday")
                            Expanded(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      day = "";
                                    });

                                    print(day);
                                  }),
                            )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Monday';
                      conttColor = Colors.grey;
                      conttColor1 = Colors.grey;
                      conttColor2 = Colors.grey;
                      conttColor3 = Colors.grey;
                      conttColor4 = Colors.grey;

                      Selected = 'Booked';
                    });
                  },
                ),
                if (day == 'Monday') Monday(),
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color(0xff00007c),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'T',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            ////backgroundColor: Colors.lightBlue,
                          )),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Tuesday',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))),
                          if (day == "")
                            Expanded(
                                child: Icon(Icons.arrow_drop_down,
                                    color: Colors.white)),
                          if (day == "Tuesday")
                            Expanded(
                              child: IconButton(
                                  icon: Icon(Icons.arrow_drop_up,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      day = "";
                                    });

                                    print(day);
                                  }),
                            )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Tuesday';
                      conttColor = Colors.grey;
                      conttColor1 = Colors.grey;
                      conttColor2 = Colors.grey;
                      conttColor3 = Colors.grey;
                      conttColor4 = Colors.grey;
                      Selected = 'Booked';
                    });
                  },
                ),
                if (day == 'Tuesday') Tuesday(),
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color(0xff00007c),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'W',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),

                            /// backgroundColor: Colors.lightBlue,
                          )),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Wednesday',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))),
                          if (day == "")
                            Expanded(
                                child: Icon(Icons.arrow_drop_down,
                                    color: Colors.white)),
                          if (day == "Wednesday")
                            Expanded(
                              child: IconButton(
                                  icon: Icon(Icons.arrow_drop_up,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      day = "";
                                    });

                                    print(day);
                                  }),
                            )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Wednesday';
                      conttColor = Colors.grey;
                      conttColor1 = Colors.grey;
                      conttColor2 = Colors.grey;
                      conttColor3 = Colors.grey;
                      conttColor4 = Colors.grey;
                      Selected = 'Booked';
                    });
                  },
                ),
                if (day == 'Wednesday') Wednesday(),
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff00007c),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      height: 50,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'T',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            //backgroundColor: Colors.lightBlue,
                          )),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Thursday',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))),
                          if (day == "")
                            Expanded(
                                child: Icon(Icons.arrow_drop_down,
                                    color: Colors.white)),
                          if (day == "Thursday")
                            Expanded(
                              child: IconButton(
                                  icon: Icon(Icons.arrow_drop_up,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      day = "";
                                    });

                                    print(day);
                                  }),
                            )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Thursday';
                      conttColor = Colors.grey;
                      conttColor1 = Colors.grey;
                      conttColor2 = Colors.grey;
                      conttColor3 = Colors.grey;
                      conttColor4 = Colors.grey;
                      Selected = 'Booked';
                    });
                  },
                ),
                if (day == 'Thursday') Thursday(),
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff00007c),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      height: 50,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'F',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            //backgroundColor: Colors.lightBlue,
                          )),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Friday',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))),
                          if (day == "")
                            Expanded(
                                child: Icon(Icons.arrow_drop_down,
                                    color: Colors.white)),
                          if (day == "Friday")
                            Expanded(
                              child: IconButton(
                                  icon: Icon(Icons.arrow_drop_up,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      day = "";
                                    });

                                    print(day);
                                  }),
                            )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Friday';
                      conttColor = Colors.grey;
                      conttColor1 = Colors.grey;
                      conttColor2 = Colors.grey;
                      conttColor3 = Colors.grey;
                      conttColor4 = Colors.grey;
                      Selected = 'Booked';
                    });
                  },
                ),
                if (day == 'Friday') Friday(),
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff00007c),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      height: 50,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'S',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            //backgroundColor: Colors.lightBlue,
                          )),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Saturday',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))),
                          if (day == "")
                            Expanded(
                                child: Icon(Icons.arrow_drop_down,
                                    color: Colors.white)),
                          if (day == "Saturday")
                            Expanded(
                              child: IconButton(
                                  icon: Icon(Icons.arrow_drop_up,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      day = "";
                                    });

                                    print(day);
                                  }),
                            )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Saturday';
                      conttColor = Colors.grey;
                      conttColor1 = Colors.grey;
                      conttColor2 = Colors.grey;
                      conttColor3 = Colors.grey;
                      conttColor4 = Colors.grey;
                      Selected = 'Booked';
                    });
                  },
                ),
                if (day == 'Saturday') Saturday(),
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff00007c),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      height: 50,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'S',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            // backgroundColor: Colors.lightBlue,
                          )),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Sunday',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))),
                          if (day == "")
                            Expanded(
                                child: Icon(Icons.arrow_drop_down,
                                    color: Colors.white)),
                          if (day == "Sunday")
                            Expanded(
                              child: IconButton(
                                  icon: Icon(Icons.arrow_drop_up,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      day = "";
                                    });

                                    print(day);
                                  }),
                            )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      day = 'Sunday';
                      conttColor = Colors.grey;
                      conttColor1 = Colors.grey;
                      conttColor2 = Colors.grey;
                      conttColor3 = Colors.grey;
                      conttColor4 = Colors.grey;
                      Selected = 'Booked';
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
            height: 320,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 20,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff00007c),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                              child: Text(docReference['Date'],
                                  style: TextStyle(color: Colors.white)))),
                      if (docReference['Time'] != 'Not set')
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Field = 'Time';
                                Selected = docReference['Time'];
                                conttColor = Colors.green;
                                conttColor1 = Colors.grey;
                                conttColor2 = Colors.grey;
                                conttColor3 = Colors.grey;
                                conttColor4 = Colors.grey;
                              });
                              print(Selected);
                            },
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time'])),
                              decoration: BoxDecoration(
                                  color: conttColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time1'] != 'Not set')
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Field = 'Time1';
                                Selected = docReference['Time1'];
                                conttColor = Colors.grey;
                                conttColor1 = Colors.green;
                                conttColor2 = Colors.grey;
                                conttColor3 = Colors.grey;
                                conttColor4 = Colors.grey;
                              });
                              print(Field);
                              print(Selected);
                            },
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time1'])),
                              decoration: BoxDecoration(
                                  color: conttColor1,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time2'] != 'Not set')
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Field = 'Time2';
                                  Selected = docReference['Time2'];
                                  conttColor = Colors.grey;
                                  conttColor1 = Colors.grey;
                                  conttColor2 = Colors.green;
                                  conttColor3 = Colors.grey;
                                  conttColor4 = Colors.grey;
                                });
                                print(Selected);
                              },
                              child: Container(
                                width: 200,
                                height: 35,
                                child:
                                    Center(child: Text(docReference['Time2'])),
                                decoration: BoxDecoration(
                                    color: conttColor2,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            )),
                      if (docReference['Time3'] != 'Not set')
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Field = 'Time3';
                                Selected = docReference['Time3'];
                                conttColor = Colors.grey;
                                conttColor1 = Colors.grey;
                                conttColor2 = Colors.grey;
                                conttColor3 = Colors.green;
                                conttColor4 = Colors.grey;
                              });
                              print(Selected);
                            },
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time3'])),
                              decoration: BoxDecoration(
                                  color: conttColor3,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      if (docReference['Time4'] != 'Not set')
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Field = 'Time4';
                                Selected = docReference['Time4'];
                                conttColor = Colors.grey;
                                conttColor1 = Colors.grey;
                                conttColor2 = Colors.grey;
                                conttColor3 = Colors.grey;
                                conttColor4 = Colors.green;
                              });
                              print(Selected);
                            },
                            child: Container(
                              width: 200,
                              height: 35,
                              child: Center(child: Text(docReference['Time4'])),
                              decoration: BoxDecoration(
                                  color: conttColor4,
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
                                      'Date': docReference['Date'],
                                      'Subject': widget.bookSub,
                                      'Grade': widget.bookgrd
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
                                      'subject': widget.bookSub,
                                      'Date': docReference['Date'],
                                    });

                                    print('on booking page');

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Checkout()));

                                    // Navigator.pop(context);
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
            height: 320,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 20,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff00007c),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                              child: Text(docReference['Date'],
                                  style: TextStyle(color: Colors.white)))),
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                              conttColor = Colors.green;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.green;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor1,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.green;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor2,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.green;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor3,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.green;
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
                                  color: conttColor4,
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
                                      'Date': docReference['Date'],
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
                                      'Time': 'Tuesday ' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub,
                                      'Date': docReference['Date'],
                                    });

                                    print('on booking page');

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Checkout()));
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
            height: 320,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 20,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff00007c),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                              child: Text(docReference['Date'],
                                  style: TextStyle(color: Colors.white)))),
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                              conttColor = Colors.green;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.green;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor1,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.green;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor2,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.green;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor3,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.green;
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
                                  color: conttColor4,
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
                                      'Time': 'Wednesday ' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Date': docReference['Date'],
                                      'Subject': widget.bookSub,
                                      'Grade': widget.bookgrd
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
                                      'Time': 'Wednesday ' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub,
                                      'Date': docReference['Date'],
                                    });

                                    print('on booking page');

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Checkout()));
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
            height: 320,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 20,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff00007c),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                              child: Text(docReference['Date'],
                                  style: TextStyle(color: Colors.white)))),
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                              conttColor = Colors.green;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.green;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor1,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.green;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor2,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.green;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor3,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.green;
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
                                  color: conttColor4,
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
                                      'Time': 'Thursday ' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Date': docReference['Date'],
                                      'Subject': widget.bookSub,
                                      'Grade': widget.bookgrd
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
                                      'Time': 'Thursday ' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub,
                                      'Date': docReference['Date'],
                                    });

                                    print('on booking page');

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Checkout()));
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
            height: 320,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 20,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff00007c),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                              child: Text(docReference['Date'],
                                  style: TextStyle(color: Colors.white)))),
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                              conttColor = Colors.green;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.green;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor1,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.green;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor2,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.green;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor3,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.green;
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
                                  color: conttColor4,
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
                                      'Time': 'Friday ' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Date': docReference['Date'],
                                      'Subject': widget.bookSub,
                                      'Grade': widget.bookgrd
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
                                      'Time': 'Friday ' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub,
                                      'Date': docReference['Date'],
                                    });

                                    print('on booking page');

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Checkout()));
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
            height: 320,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 20,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff00007c),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                              child: Text(docReference['Date'],
                                  style: TextStyle(color: Colors.white)))),
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              conttColor = Colors.green;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.green;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor1,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.green;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor2,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.green;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor3,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.green;
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
                                  color: conttColor4,
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
                                      'Time': 'Saturday ' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Date': docReference['Date'],
                                      'Subject': widget.bookSub,
                                      'Grade': widget.bookgrd
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
                                      'Time': 'Saturday ' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub,
                                      'Date': docReference['Date'],
                                    });

                                    print('on booking page');

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Checkout()));
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
            height: 320,
            child: ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 20,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff00007c),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                              child: Text(docReference['Date'],
                                  style: TextStyle(color: Colors.white)))),
                      if (docReference['Time'] != 'Not set')
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Field = 'Time';
                              Selected = docReference['Time'];
                              conttColor = Colors.green;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.green;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor1,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.green;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor2,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.green;
                              conttColor4 = Colors.grey;
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
                                  color: conttColor3,
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
                              conttColor = Colors.grey;
                              conttColor1 = Colors.grey;
                              conttColor2 = Colors.grey;
                              conttColor3 = Colors.grey;
                              conttColor4 = Colors.green;
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
                                  color: conttColor4,
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
                                      'Time': 'Sunday ' + Selected,
                                      'User':
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Date': docReference['Date'],
                                      'Subject': widget.bookSub,
                                      'Grade': widget.bookgrd
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
                                      'Time': 'Sunday ' + Selected,
                                      'Link': 'join' +
                                          FirebaseAuth.instance.currentUser.uid,
                                      'Teacher': widget.techname,
                                      'subject': widget.bookSub,
                                      'Date': docReference['Date'],
                                    });

                                    print('on booking page');

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Checkout()));
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
