import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jitsist/Payment&Booking/Booking.dart';
import 'package:jitsist/Payment&Booking/BookingNew.dart';
import 'package:jitsist/Payment&Booking/VdoByT.dart';

class profileScreen extends StatefulWidget {
  String PId;
  String img;
  String tname;
  String sub;
  profileScreen({
    @required this.PId,
    @required this.img,
    @required this.tname,
    // @required this.sub,
  });
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  String uName;
  String city;
  String grade;
  String subject;
  String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*   appBar: AppBar(
          title: Text("Teacher Profile"),
          backgroundColor: Color(0xff00007c),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),*/
        body: Container(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Teacher")
              .where('id', isEqualTo: widget.PId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("You havent updated your profile yet"),
              );
              //  Center(child: LoadingFilling.square());
            }
            return ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;

              List<String> GradeList = List.from(docReference['Grade']);
              int GradeCount = GradeList.length;

              List<String> SubjectList = List.from(docReference['Subject']);
              int subCount = SubjectList.length;
              return Center(
                  child: Column(
                children: [
                  Container(
                      height: 285,
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
                      // alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: IconButton(
                                  icon: Icon(Icons.arrow_back,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                          ),
                          /* Center(
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  NetworkImage(docReference['Image']),
                            ),
                          )*/
                          Center(
                              child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(docReference['Image']),
                                  fit: BoxFit.fill),
                              color: Color(0xff00007c),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xAA6EB1E6),
                                  offset: Offset(1, 8),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ))
                        ],
                      )),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(docReference['Name'],
                          style: TextStyle(
                            fontSize: 37,
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(docReference['Medium'],
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                )),
                            Text(' Medium',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                )),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('5',
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            )
                          ]),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'About Me',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 25),
                              ),
                            ]),
                      ),
                      Divider(),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(docReference['About'])),

                      ///////////////////////////////////////////////////////////////////////////////////////////////////
                      //////////////////////////
                      //////////////////////////////////////////
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              value: grade,
                              hint: Text(" Grade"),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 16,
                              elevation: 16,
                              style: TextStyle(color: Color(0xff00007c)),
                              underline: Container(
                                height: 2,
                                color: Color(0xff00007c),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  grade = newValue;
                                });
                              },
                              items: GradeList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          //////////////////

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              value: subject,
                              hint: Text(" Subject"),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 16,
                              elevation: 16,
                              style: TextStyle(color: Color(0xff00007c)),
                              underline: Container(
                                height: 2,
                                color: Color(0xff00007c),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  subject = newValue;
                                });
                              },
                              items: SubjectList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      /////////////////////////////////////////
                      ///
                      /*  RaisedButton(onPressed: () {
                        print(subject);
                        print(grade);
                      }),*/
                      SizedBox(
                        height: 30,
                      ),
                      // ignore: deprecated_member_use
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xff00007c),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: FlatButton(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  ' Next',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            onPressed: () {
                              if (subject != null && grade != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookClass(
                                              Id: widget.PId,
                                              bookSub: subject,
                                              techname: widget.tname,
                                              bookgrd: grade,
                                            )));
                              } else {
                                AlertDialog alert = AlertDialog(
                                  title:
                                      Text("Please Select Subject and Grade  "),
                                  actions: [
                                    FlatButton(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("Ok"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext) {
                                      return alert;
                                    },
                                    barrierDismissible: true);
                              }
                            }),
                      )
                    ],
                  )
                ],
              ));
            }).toList());
          }),
    ));
  }
}
