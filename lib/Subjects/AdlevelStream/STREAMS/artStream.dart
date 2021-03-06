import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/Subjects/Subjects.dart';

class artStream extends StatelessWidget {
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
                        child: Text('Art Stream',
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
              /*  Padding(
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
                                          sub: 'Economics',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/ecof.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Economics")
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
                                          sub: 'Geography',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/geof.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Geography")
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
                                          sub: 'History',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/historyf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("History")
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
                                          sub: 'Home Economics',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/hecof.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Home Economics")
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
                                          sub: 'Political Science',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/polif.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Political Science")
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
                                          sub: 'Logic',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/Quizzz.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Logic")
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
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/tsmf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("The scientific method")
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
                                          sub: 'Accounting',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/mathsf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Accounting")
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
                                          sub: 'Business Statistics',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/bstatf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Business Statistics")
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
                                          sub: 'Business Studies',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/FreeClass.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Business Studies")
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
                                          sub: 'Technology Studies',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/phyf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Technology Studies")
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
                                          sub: 'Communication',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/commuf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Communication")
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
                                          sub: 'Mass Media',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/mediaf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Mass Media")
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
                                          sub: 'Information',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/Pastp.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Information")
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
                                          sub: 'Communication Technology',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/sciencef.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Communication Technology ")
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
