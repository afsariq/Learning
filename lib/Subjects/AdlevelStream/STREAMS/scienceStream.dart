import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';

import '../../Subjects.dart';

class scienceStream extends StatelessWidget {
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
                        child: Text('Bio Science',
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
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              /*   Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            const Color(0xff00007c),
                            const Color(0xffb74093),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  // color: Colors.amberAccent,
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Image.asset(
                            "Assets/Images/logo.png",
                            width: 150,
                            height: 180,
                          )),
                      RaisedButton(
                        onPressed: () {},
                        child: Text("Try free classes"),
                        shape: StadiumBorder(),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),*/
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Subject(
                                          cls: 'A/L',
                                          sub: 'Biology',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/healthf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Biology")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Subject(
                                          cls: 'A/L',
                                          sub: 'Physics',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/phyf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Physics")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Subject(
                                          cls: 'A/L',
                                          sub: 'Chemistry',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/chemf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Chemistry")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Subject(
                                          cls: 'A/L',
                                          sub: 'Agriculture',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/geof.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Agricultural science")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
