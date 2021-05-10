import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:jitsist/Payment&Booking/Booking.dart';

class profileScreen extends StatefulWidget {
  String PId;
  String img;
  profileScreen({
    @required this.PId,
    @required this.img,
  });
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  String uName;
  String city;
  String grade;
  String sub;
  String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Teacher Profile"),
          backgroundColor: Color(0xff00007c),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              //  image: DecorationImage(
              //image: NetworkImage(),
              // fit: BoxFit.cover,
              // ),
              ),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Teacher")
                  .where('id', isEqualTo: widget.PId)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("You havent updated your profile yet"),
                  );
                  //  Center(child: LoadingFilling.square());
                }
                return ListView(
                    children: snapshot.data.docs.map((docReference) {
                  String id = docReference.id;
                  return Center(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Image.network(
                          docReference['Image'],
                          width: double.infinity,
                          // width: 320,
                          //height: 550,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  docReference['Name'],
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Rating : ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "5",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'City : ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    docReference['City'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Class : ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    docReference['Class'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Subject : ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    docReference['Subject'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        /* Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Phone No : ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    docReference['Phone'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),*/
                        /*
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Email : ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    FirebaseAuth.instance.currentUser.email,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),*/
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Color(0xff00007c),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Booking(
                                            Id: widget.PId,
                                          )));
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )),
                  );
                }).toList());
              }),
        ));
  }
}
