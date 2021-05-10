import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsist/Payment&Booking/Booking.dart';

class SearchTeacher extends StatefulWidget {
  @override
  _SearchTeacherState createState() => _SearchTeacherState();
}

class _SearchTeacherState extends State<SearchTeacher> {
  @override
  String grade;
  String subject;
  String _chosenValue;
  final TextEditingController searchCont = TextEditingController();
  final TextEditingController searchContsub = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   backgroundColor: Colors.blueGrey[50],

        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Color(0xff00007c),
          title: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          borderRadius: BorderRadius.all(Radius.circular(35))),
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
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Teacher")
                .where('Class', isEqualTo: grade)
                .where('Subject', isEqualTo: subject)
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
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          ///////////////////////////////////////////////
                          Row(children: [
                            Column(children: [
                              Row(children: [
                                SizedBox(
                                  width: 110,
                                  child: Image.network(
                                    docReference['Image'],
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      docReference['Name'],
                                      style: TextStyle(fontSize: 25),
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
                                    RaisedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Booking(
                                                      Id: id,
                                                    )));
                                      },
                                      child: Text(
                                        "Select",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      shape: StadiumBorder(),
                                      color: Color(0xff00007c),
                                    ),
                                  ],
                                )
                              ]),
                            ]),
                          ]),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList());
            }));
  }
}
