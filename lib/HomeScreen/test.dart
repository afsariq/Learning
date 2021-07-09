import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/Payment&Booking/Profile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/Payment&Booking/VdoByT.dart';
import 'package:async/async.dart';

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    Stream<List<QuerySnapshot>> getData() {
      Stream stream1 = FirebaseFirestore.instance
          .collection('Teacher')
          .where('Grade', isEqualTo: '7')
          .snapshots();
      Stream stream2 = FirebaseFirestore.instance
          .collection('Teacher')
          .where('Grade1', isEqualTo: '7')
          .snapshots();
      return StreamZip([stream1, stream2]);
    }

    return new Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: getData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<QuerySnapshot>> snapshot1) {
            List<QuerySnapshot> querySnapshotData = snapshot1.data.toList();

            //copy document snapshots from second stream to first so querySnapshotData[0].documents will have all documents from both query snapshots
            querySnapshotData[1].docs.addAll(querySnapshotData[0].docs);

            if (querySnapshotData[0].docs.isEmpty)
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            if (querySnapshotData[0].docs.length == 0)
              return const Center(
                child: Text(
                  "Not Available",
                  style: TextStyle(fontSize: 30.0, color: Colors.grey),
                ),
              );

            return ListView(children: [
              Column(
                  children: querySnapshotData[1]
                      .docs
                      .map((DocumentSnapshot document) {
                // put your logic here. You will have access to document from both streams as "document" here
                return Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => profileScreen(
                                          PId: document.id,
                                          img: document['Image'],
                                          tname: document['Name'],
                                          sub: document['Subject'],
                                        )));
                          },
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
                                    child: CircleAvatar(
                                      //  width: 110,
                                      backgroundImage: NetworkImage(
                                        document['Image'],
                                      ),
                                      radius: 60,
                                      /*child: Image.network(
                                    docReference['Image'],
                                    width: 100,
                                    height: 100,
                                  ),*/
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          document['Name'],
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
                                              document['Medium'],
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              ' Medium',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Grade :',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              document['Grade'],
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          document['Subject'],
                                          style: TextStyle(fontSize: 15),
                                        ),
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
                                                                PId:
                                                                    document.id,
                                                                img: document[
                                                                    'Image'],
                                                                tname: document[
                                                                    'Name'],
                                                                sub: document[
                                                                    'Subject'],
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
                                                                TechId:
                                                                    document.id,
                                                                Techname:
                                                                    document[
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
                                        /* RaisedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Select",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      shape: StadiumBorder(),
                                      color: Color(0xff00007c),
                                    ),*/
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }).toList()),
              Column(
                  children: querySnapshotData[0]
                      .docs
                      .map((DocumentSnapshot document) {
                // put your logic here. You will have access to document from both streams as "document" here
                return Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => profileScreen(
                                          PId: document.id,
                                          img: document['Image'],
                                          tname: document['Name'],
                                          sub: document['Subject'],
                                        )));
                          },
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
                                    child: CircleAvatar(
                                      //  width: 110,
                                      backgroundImage: NetworkImage(
                                        document['Image'],
                                      ),
                                      radius: 60,
                                      /*child: Image.network(
                                    docReference['Image'],
                                    width: 100,
                                    height: 100,
                                  ),*/
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          document['Name'],
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
                                              document['Medium'],
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              ' Medium',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Grade :',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              document['Grade'],
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          document['Subject'],
                                          style: TextStyle(fontSize: 15),
                                        ),
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
                                                                PId:
                                                                    document.id,
                                                                img: document[
                                                                    'Image'],
                                                                tname: document[
                                                                    'Name'],
                                                                sub: document[
                                                                    'Subject'],
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
                                                                TechId:
                                                                    document.id,
                                                                Techname:
                                                                    document[
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
                                        /* RaisedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Select",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      shape: StadiumBorder(),
                                      color: Color(0xff00007c),
                                    ),*/
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }).toList())
            ]);
          }),
    );
  }
}
