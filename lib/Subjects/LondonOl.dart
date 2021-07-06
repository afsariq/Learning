import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/Payment&Booking/Profile.dart';
import 'package:jitsist/Payment&Booking/VdoByT.dart';

class LondonOl extends StatefulWidget {
  @override
  _LondonOlState createState() => _LondonOlState();
}

class _LondonOlState extends State<LondonOl> {
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
                        child: Text('London O/L',
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
                                  hintText: "Subject",
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
                                    clsno =  searchCont.text ;
                                    print(clsno);
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
          stream: FirebaseFirestore.instance
              .collection("Teacher")
              .where('Class', isEqualTo: 'London O/L')
              .where('Subject', isEqualTo: clsno)
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
            return ListView(
                children: snapshot.data.docs.map((docReference) {
              String id = docReference.id;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
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
                                radius: 50,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("5"),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  Text(
                                    docReference['Subject'],
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
                                                          PId: id,
                                                          img: docReference[
                                                              'Image'],
                                                          tname: docReference[
                                                              'Name'],
                                                          sub: docReference[
                                                              'Subject'],
                                                        )));
                                          },
                                          child: Text(
                                            "Select",
                                            style:
                                                TextStyle(color: Colors.white),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          shape: StadiumBorder(),
                                          color: Color(0xff00007c),
                                        ),
                                      ),
                                    ],
                                  ),
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
          }),
    );
  }
}
