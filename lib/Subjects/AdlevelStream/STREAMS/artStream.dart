import 'package:flutter/material.dart';
import 'package:jitsist/Subjects/Subjects.dart';

class artStream extends StatelessWidget {
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
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Padding(
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
                                          sub: 'Economics',
                                        )),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/math.png"),
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
                                  AssetImage("Assets/Images/phy.jpg"),
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
                                  AssetImage("Assets/Images/eng.jpeg"),
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
                                  AssetImage("Assets/Images/math.png"),
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
                                  AssetImage("Assets/Images/phy.jpg"),
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
                                  AssetImage("Assets/Images/eng.jpeg"),
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
                                  AssetImage("Assets/Images/math.png"),
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
                                  AssetImage("Assets/Images/phy.jpg"),
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
                                  AssetImage("Assets/Images/eng.jpeg"),
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
                                  AssetImage("Assets/Images/math.png"),
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
                                  AssetImage("Assets/Images/phy.jpg"),
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
                                  AssetImage("Assets/Images/eng.jpeg"),
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
                                  AssetImage("Assets/Images/math.png"),
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
                                  AssetImage("Assets/Images/phy.jpg"),
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
                                  AssetImage("Assets/Images/eng.jpeg"),
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
