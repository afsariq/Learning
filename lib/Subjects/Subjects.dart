import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/Payment&Booking/Profile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/Payment&Booking/VdoByT.dart';

class Subject extends StatefulWidget {
  String cls;
  String sub;
  Subject({
    @required this.cls,
    @required this.sub,
  });

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 80),
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
                          child: Text(widget.sub,
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
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
            stream: FirebaseFirestore.instance
                .collection("Teacher")
                .where('Class', isEqualTo: widget.cls)
                .where('Subject', arrayContainsAny: [widget.sub]).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: SpinKitRing(
                  color: Colors.blue,
                ));
                //  Center(child: LoadingFilling.square());
              }
              return ListView(
                  children: snapshot.data.docs.map((docReference) {
                String id = docReference.id;

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => profileScreen(
                                      PId: id,
                                      img: docReference['Image'],
                                      tname: docReference['Name'],
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
                                    docReference['Image'],
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
                                    /* Text(
                                      docReference['Subject'],
                                      style: TextStyle(fontSize: 15),
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
                );
              }).toList());
            }));
  }
}
