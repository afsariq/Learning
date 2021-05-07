import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Booking extends StatefulWidget {
  String Id;

  Booking({
    @required this.Id,
  });

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String a = '';
  MaterialColor contColor = Colors.grey;
  MaterialColor contColor1 = Colors.grey;
  MaterialColor contColor2 = Colors.grey;
  MaterialColor contColor3 = Colors.grey;
  MaterialColor contColor4 = Colors.grey;
  String selected = null;
  String field;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff00007c),
          actions: [
            // IconButton(icon: Icon(Icons.chat_bubble), onPressed: () {})
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Teacher")
                .doc(widget.Id)
                .collection('ClassTime')
                .where('id', isEqualTo: widget.Id)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No data"),
                );
                //  Center(child: LoadingFilling.square());
              }
              return ListView(
                  children: snapshot.data.docs.map((docReference) {
                String id = docReference.id;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Select Time",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //if (time == 'Not set') timew(),
                          if (docReference['Time'] != 'Not set')
                            GestureDetector(
                              child: Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: contColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(docReference["Time"]),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selected = docReference['Time'];
                                  field = 'Time';
                                  contColor = Colors.green;
                                  contColor4 = Colors.grey;
                                  contColor1 = Colors.grey;
                                  contColor2 = Colors.grey;
                                  contColor3 = Colors.grey;
                                });
                              },
                            ),
                          SizedBox(
                            height: 5,
                          ),
                          if (docReference['Time1'] != 'Not set')
                            GestureDetector(
                              child: Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: contColor1,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    docReference['Time1'],
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selected = docReference['Time1'];
                                  field = 'Time1';
                                  contColor1 = Colors.green;
                                  contColor = Colors.grey;
                                  contColor4 = Colors.grey;
                                  contColor2 = Colors.grey;
                                  contColor3 = Colors.grey;
                                });
                              },
                            ),
                          SizedBox(
                            height: 5,
                          ),
                          if (docReference['Time2'] != 'Not set')
                            GestureDetector(
                              child: Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: contColor2,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    docReference['Time2'],
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selected = docReference['Time2'];
                                  field = 'Time2';
                                  contColor2 = Colors.green;
                                  contColor = Colors.grey;
                                  contColor1 = Colors.grey;
                                  contColor4 = Colors.grey;
                                  contColor3 = Colors.grey;
                                });
                              },
                            ),
                          SizedBox(
                            height: 5,
                          ),
                          if (docReference['Time3'] != 'Not set')
                            GestureDetector(
                              child: Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: contColor3,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    docReference['Time3'],
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selected = docReference['Time3'];
                                  field = 'Time3';
                                  contColor3 = Colors.green;
                                  contColor = Colors.grey;
                                  contColor1 = Colors.grey;
                                  contColor2 = Colors.grey;
                                  contColor4 = Colors.grey;
                                });
                              },
                            ),
                          SizedBox(
                            height: 5,
                          ),
                          if (docReference['Time4'] != 'Not set')
                            GestureDetector(
                              child: Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: contColor4,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    docReference['Time4'],
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selected = docReference['Time4'];
                                  field = 'Time4';
                                  contColor4 = Colors.green;
                                  contColor = Colors.grey;
                                  contColor1 = Colors.grey;
                                  contColor2 = Colors.grey;
                                  contColor3 = Colors.grey;
                                });
                              },
                            ),
                          SizedBox(
                            height: 5,
                          ),

                          //   Row(
                          //   children: [
                          //   IconButton(
                          //     icon: Icon(Icons.clear),
                          //   onPressed: () {
                          //   setState(() {
                          //   contColor4 = Colors.grey;
                          // contColor = Colors.grey;
                          // contColor1 = Colors.grey;
                          // contColor2 = Colors.grey;
                          // contColor3 = Colors.grey;
                          // selected = null;
                          /// });
                          //})
                          //  ],
                          //),
                          SizedBox(
                            height: 50,
                          ),
                          RaisedButton(
                            onPressed: () {
                              print(selected);
                              print(field);

                              AlertDialog alert = AlertDialog(
                                title: Text("You Selected     " + selected),
                                actions: [
                                  FlatButton(
                                    child: Row(
                                      children: [
                                        Text("Back"),
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
                                          .collection('ClassTime')
                                          .doc(widget.Id)
                                          .update(
                                              {field: 'booked  ' + selected});
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
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: StadiumBorder(),
                            color: Color(0xff00007c),
                          ),

                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 35,
                              decoration: BoxDecoration(
                                  gradient: new LinearGradient(
                                      colors: [
                                        const Color(0xff4caf50),
                                        const Color(0xFF00CCFF),
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                child: Text(
                                  "Pay Here",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ],
                );
              }).toList());
            }));
  }
}
