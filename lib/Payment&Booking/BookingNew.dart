import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/Payment&Booking/Checkout.dart';
import 'package:jitsist/Payment&Booking/Profile.dart';
import 'package:intl/intl.dart';

String Field;
String Selected;
String selectedTime, selectedDuration;
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
  String tappedSlot;
  bool slotBooked;
  MaterialColor slotColor = Colors.grey;
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
                SizedBox(height: 20),
                Text(
                  'Select a Slot and Confirm to book',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 8.0,
                      right: 8.0,
                    ),
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
    DateTime date = DateTime.now();

    var lastMonday = date
        .subtract(Duration(days: date.weekday - DateTime.monday))
        .toString()
        .substring(0, 10);
    int lengthOfSlots;

    return Column(
      children: [
        Text(lastMonday),

        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Teacher')
                .doc(widget.Id)
                .collection('ClassTimes')
                .doc('Monday')
                .collection('Time Slot')
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

              lengthOfSlots = snapshot.data.docs.length ?? 0;
              print('------in Mondays  -slots ' + lengthOfSlots.toString());

              return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: snapshot.data.docs.map((docReference) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (docReference['Booked'] == true) {
                                slotBooked = true;
                              }
                              tappedSlot = docReference['Time'] +
                                  docReference['Duration'];
                              selectedTime = docReference['Time'];
                              selectedDuration = docReference['Duration'];
                              print(docReference['Time'] +
                                  '     ' +
                                  docReference['Duration']);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 70),
                            width: 200,
                            height: 35,
                            child: Center(
                                child: Text(docReference['Time'] +
                                    " (" +
                                    docReference['Duration'] +
                                    ")")),
                            decoration: BoxDecoration(
                                color: findSlotColor(
                                    docReference['Time'] +
                                        docReference['Duration'],
                                    docReference['Booked']),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    );
                  }).toList());

              // } else
              //   return Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text('No Time Slots'),
              //   );
            }),

        SizedBox(
          height: 5.0,
        ),

        //confirm button
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff00007c),
            ),
            child: FlatButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('---on press');
                print(slotBooked.toString());

                //if slot is booked
                if (slotBooked == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Slot Booked",
                          style: TextStyle(color: Colors.red),
                        ),
                        content: Text(
                            "Slot is already Booked. Please select another slot"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  AlertDialog alert = AlertDialog(
                    title:
                        Text("You Selected     " + "Monday - " + selectedTime),
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
                          print('on booking page');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout(
                                      id: widget.Id,
                                      bookSub: widget.bookSub,
                                      bookgrd: widget.bookgrd,
                                      techname: widget.techname,
                                      date: lastMonday,
                                      classType: 'individual class',
                                      day: 'Monday')));

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
                }
                // displayNotificationwed();
              },
            )),
      ],
    );
  }

  Widget Tuesday() {
    DateTime date = DateTime.now();

    var lastTuesday = date
        .subtract(Duration(days: date.weekday - DateTime.tuesday))
        .toString()
        .substring(0, 10);
    int lengthOfSlots;

    return Column(
      children: [
        Text(lastTuesday),

        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Teacher')
                .doc(widget.Id)
                .collection('ClassTimes')
                .doc('Tuesday')
                .collection('Time Slot')
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

              lengthOfSlots = snapshot.data.docs.length ?? 0;
              print('------in Tuesdays  -slots ' + lengthOfSlots.toString());

              return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: snapshot.data.docs.map((docReference) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (docReference['Booked'] == true) {
                                slotBooked = true;
                              }
                              tappedSlot = docReference['Time'] +
                                  docReference['Duration'];
                              selectedTime = docReference['Time'];
                              selectedDuration = docReference['Duration'];
                              print(docReference['Time'] +
                                  '     ' +
                                  docReference['Duration']);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 70),
                            width: 200,
                            height: 35,
                            child: Center(
                                child: Text(docReference['Time'] +
                                    " (" +
                                    docReference['Duration'] +
                                    ")")),
                            decoration: BoxDecoration(
                                color: findSlotColor(
                                    docReference['Time'] +
                                        docReference['Duration'],
                                    docReference['Booked']),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    );
                  }).toList());

              // } else
              //   return Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text('No Time Slots'),
              //   );
            }),

        SizedBox(
          height: 5.0,
        ),

        //confirm button
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff00007c),
            ),
            child: FlatButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('---on press');

                print(slotBooked.toString());

                //if slot is booked
                if (slotBooked == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Slot Booked",
                          style: TextStyle(color: Colors.red),
                        ),
                        content: Text(
                            "Slot is already Booked. Please select another slot"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  AlertDialog alert = AlertDialog(
                    title:
                        Text("You Selected     " + "Tuesday - " + selectedTime),
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
                          print('on booking page');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout(
                                      id: widget.Id,
                                      bookSub: widget.bookSub,
                                      bookgrd: widget.bookgrd,
                                      techname: widget.techname,
                                      date: lastTuesday,
                                      classType: 'individual class',
                                      day: 'Tuesday')));

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
                }

                // displayNotificationwed();
              },
            )),
      ],
    );
  }

  Widget Wednesday() {
    DateTime date = DateTime.now();

    var lastWednesday = date
        .subtract(Duration(days: date.weekday - DateTime.wednesday))
        .toString()
        .substring(0, 10);
    int lengthOfSlots;

    return Column(
      children: [
        Text(lastWednesday),

        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Teacher')
                .doc(widget.Id)
                .collection('ClassTimes')
                .doc('Wednesday')
                .collection('Time Slot')
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

              lengthOfSlots = snapshot.data.docs.length ?? 0;
              print('------in wednesdays  -slots ' + lengthOfSlots.toString());

              return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: snapshot.data.docs.map((docReference) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (docReference['Booked'] == true) {
                                slotBooked = true;
                              }
                              tappedSlot = docReference['Time'] +
                                  docReference['Duration'];
                              selectedTime = docReference['Time'];
                              selectedDuration = docReference['Duration'];
                              print(docReference['Time'] +
                                  '     ' +
                                  docReference['Duration']);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 70),
                            width: 200,
                            height: 35,
                            child: Center(
                                child: Text(docReference['Time'] +
                                    " (" +
                                    docReference['Duration'] +
                                    ")")),
                            decoration: BoxDecoration(
                                color: findSlotColor(
                                    docReference['Time'] +
                                        docReference['Duration'],
                                    docReference['Booked']),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    );
                  }).toList());

              // } else
              //   return Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text('No Time Slots'),
              //   );
            }),

        SizedBox(
          height: 5.0,
        ),

        //confirm button
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff00007c),
            ),
            child: FlatButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('---on press');
                print(slotBooked);

                //if slot is booked
                if (slotBooked == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Slot Booked",
                          style: TextStyle(color: Colors.red),
                        ),
                        content: Text(
                            "Slot is already Booked. Please select another slot"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  AlertDialog alert = AlertDialog(
                    title: Text(
                        "You Selected     " + "Wednesday - " + selectedTime),
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
                          print('on booking page');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout(
                                      id: widget.Id,
                                      bookSub: widget.bookSub,
                                      bookgrd: widget.bookgrd,
                                      techname: widget.techname,
                                      date: lastWednesday,
                                      classType: 'individual class',
                                      day: 'Wednesday')));

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
                }

                // displayNotificationwed();
              },
            )),
      ],
    );
  }

  Widget Thursday() {
    DateTime date = DateTime.now();

    var lastThursday = date
        .subtract(Duration(days: date.weekday - DateTime.thursday))
        .toString()
        .substring(0, 10);
    int lengthOfSlots;

    return Column(
      children: [
        Text(lastThursday),

        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Teacher')
                .doc(widget.Id)
                .collection('ClassTimes')
                .doc('Thursday')
                .collection('Time Slot')
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

              lengthOfSlots = snapshot.data.docs.length ?? 0;
              print('------in Thursday  -slots ' + lengthOfSlots.toString());

              return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: snapshot.data.docs.map((docReference) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (docReference['Booked'] == true) {
                                slotBooked = true;
                              }
                              tappedSlot = docReference['Time'] +
                                  docReference['Duration'];
                              selectedTime = docReference['Time'];
                              selectedDuration = docReference['Duration'];
                              print(docReference['Time'] +
                                  '     ' +
                                  docReference['Duration']);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 70),
                            width: 200,
                            height: 35,
                            child: Center(
                                child: Text(docReference['Time'] +
                                    " (" +
                                    docReference['Duration'] +
                                    ")")),
                            decoration: BoxDecoration(
                                color: findSlotColor(
                                    docReference['Time'] +
                                        docReference['Duration'],
                                    docReference['Booked']),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    );
                  }).toList());

              // } else
              //   return Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text('No Time Slots'),
              //   );
            }),

        SizedBox(
          height: 5.0,
        ),

        //confirm button
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff00007c),
            ),
            child: FlatButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('---on press');

                print(slotBooked.toString());

                //if slot is booked
                if (slotBooked == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Slot Booked",
                          style: TextStyle(color: Colors.red),
                        ),
                        content: Text(
                            "Slot is already Booked. Please select another slot"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  AlertDialog alert = AlertDialog(
                    title: Text(
                        "You Selected     " + "Thursday - " + selectedTime),
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
                          print('on booking page');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout(
                                      id: widget.Id,
                                      bookSub: widget.bookSub,
                                      bookgrd: widget.bookgrd,
                                      techname: widget.techname,
                                      date: lastThursday,
                                      classType: 'individual class',
                                      day: 'Thursday')));

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
                }

                // displayNotificationwed();
              },
            )),
      ],
    );
  }

  Widget Friday() {
    DateTime date = DateTime.now();

    var lastFriday = date
        .subtract(Duration(days: date.weekday - DateTime.friday))
        .toString()
        .substring(0, 10);
    int lengthOfSlots;

    return Column(
      children: [
        Text(lastFriday),

        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Teacher')
                .doc(widget.Id)
                .collection('ClassTimes')
                .doc('Friday')
                .collection('Time Slot')
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

              lengthOfSlots = snapshot.data.docs.length ?? 0;
              print('------in friday  -slots ' + lengthOfSlots.toString());

              return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: snapshot.data.docs.map((docReference) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (docReference['Booked'] == true) {
                                slotBooked = true;
                              }
                              tappedSlot = docReference['Time'] +
                                  docReference['Duration'];
                              selectedTime = docReference['Time'];
                              selectedDuration = docReference['Duration'];
                              print(docReference['Time'] +
                                  '     ' +
                                  docReference['Duration']);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 70),
                            width: 200,
                            height: 35,
                            child: Center(
                                child: Text(docReference['Time'] +
                                    " (" +
                                    docReference['Duration'] +
                                    ")")),
                            decoration: BoxDecoration(
                                color: findSlotColor(
                                    docReference['Time'] +
                                        docReference['Duration'],
                                    docReference['Booked']),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    );
                  }).toList());

              // } else
              //   return Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text('No Time Slots'),
              //   );
            }),

        SizedBox(
          height: 5.0,
        ),

        //confirm button
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff00007c),
            ),
            child: FlatButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('---on press');
                print(slotBooked.toString());

                //if slot is booked
                if (slotBooked == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Slot Booked",
                          style: TextStyle(color: Colors.red),
                        ),
                        content: Text(
                            "Slot is already Booked. Please select another slot"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  AlertDialog alert = AlertDialog(
                    title:
                        Text("You Selected     " + "Friday - " + selectedTime),
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
                          print('on booking page');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout(
                                      id: widget.Id,
                                      bookSub: widget.bookSub,
                                      bookgrd: widget.bookgrd,
                                      techname: widget.techname,
                                      date: lastFriday,
                                      classType: 'individual class',
                                      day: 'Friday')));

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
                }

                // displayNotificationwed();
              },
            )),
      ],
    );
  }

  Widget Saturday() {
    DateTime date = DateTime.now();

    var lastSaturday = date
        .subtract(Duration(days: date.weekday - DateTime.saturday))
        .toString()
        .substring(0, 10);
    int lengthOfSlots;

    return Column(
      children: [
        Text(lastSaturday),

        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Teacher')
                .doc(widget.Id)
                .collection('ClassTimes')
                .doc('Saturday')
                .collection('Time Slot')
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

              lengthOfSlots = snapshot.data.docs.length ?? 0;
              print('------in saturday  -slots ' + lengthOfSlots.toString());

              return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: snapshot.data.docs.map((docReference) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (docReference['Booked'] == true) {
                                slotBooked = true;
                              }
                              tappedSlot = docReference['Time'] +
                                  docReference['Duration'];
                              selectedTime = docReference['Time'];
                              selectedDuration = docReference['Duration'];
                              print(docReference['Time'] +
                                  '     ' +
                                  docReference['Duration']);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 70),
                            width: 200,
                            height: 35,
                            child: Center(
                                child: Text(docReference['Time'] +
                                    " (" +
                                    docReference['Duration'] +
                                    ")")),
                            decoration: BoxDecoration(
                                color: findSlotColor(
                                    docReference['Time'] +
                                        docReference['Duration'],
                                    docReference['Booked']),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    );
                  }).toList());

              // } else
              //   return Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text('No Time Slots'),
              //   );
            }),

        SizedBox(
          height: 5.0,
        ),

        //confirm button
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff00007c),
            ),
            child: FlatButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('---on press');
                print(slotBooked.toString());

                //if slot is booked
                if (slotBooked == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Slot Booked",
                          style: TextStyle(color: Colors.red),
                        ),
                        content: Text(
                            "Slot is already Booked. Please select another slot"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  AlertDialog alert = AlertDialog(
                    title: Text(
                        "You Selected     " + "Saturday - " + selectedTime),
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
                          print('on booking page');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout(
                                      id: widget.Id,
                                      bookSub: widget.bookSub,
                                      bookgrd: widget.bookgrd,
                                      techname: widget.techname,
                                      date: lastSaturday,
                                      classType: 'individual class',
                                      day: 'Saturday')));

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
                }

                // displayNotificationwed();
              },
            )),
      ],
    );
  }

  Widget Sunday() {
    DateTime date = DateTime.now();

    var lastSunday = date
        .subtract(Duration(days: date.weekday - DateTime.sunday))
        .toString()
        .substring(0, 10);
    int lengthOfSlots;

    return Column(
      children: [
        Text(lastSunday),

        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Teacher')
                .doc(widget.Id)
                .collection('ClassTimes')
                .doc('Sunday')
                .collection('Time Slot')
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

              lengthOfSlots = snapshot.data.docs.length ?? 0;
              print('------in sundays  -slots ' + lengthOfSlots.toString());

              return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: snapshot.data.docs.map((docReference) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (docReference['Booked'] == true) {
                                slotBooked = true;
                              }
                              tappedSlot = docReference['Time'] +
                                  docReference['Duration'];
                              selectedTime = docReference['Time'];
                              selectedDuration = docReference['Duration'];
                              print(docReference['Time'] +
                                  '     ' +
                                  docReference['Duration']);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 70),
                            width: 200,
                            height: 35,
                            child: Center(
                                child: Text(docReference['Time'] +
                                    " (" +
                                    docReference['Duration'] +
                                    ")")),
                            decoration: BoxDecoration(
                                color: findSlotColor(
                                    docReference['Time'] +
                                        docReference['Duration'],
                                    docReference['Booked']),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    );
                  }).toList());

              // } else
              //   return Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text('No Time Slots'),
              //   );
            }),

        SizedBox(
          height: 5.0,
        ),

        //confirm button
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff00007c),
            ),
            child: FlatButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('---on press');
                print(slotBooked.toString());

                //if slot is booked
                if (slotBooked == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Slot Booked",
                          style: TextStyle(color: Colors.red),
                        ),
                        content: Text(
                            "Slot is already Booked. Please select another slot"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  AlertDialog alert = AlertDialog(
                    title:
                        Text("You Selected     " + "Sunday - " + selectedTime),
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
                          print('on booking page');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout(
                                      id: widget.Id,
                                      bookSub: widget.bookSub,
                                      bookgrd: widget.bookgrd,
                                      techname: widget.techname,
                                      date: lastSunday,
                                      classType: 'individual class',
                                      day: 'Sunday')));

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
                }

                // displayNotificationwed();
              },
            )),
      ],
    );
  }

  Color findSlotColor(timeAndDuration, booked) {
    if (booked == true) {
      return Colors.grey;
    } else if (timeAndDuration == tappedSlot)
      return Colors.green.shade400;
    else
      return Colors.blue.shade300;
  }
}
