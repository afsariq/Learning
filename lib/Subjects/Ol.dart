import 'package:flutter/material.dart';

class OLsubjects extends StatelessWidget {
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
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
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
                          Text("Maths")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/phy.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Science")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/eng.jpeg"),
                              radius: 30,
                            ),
                          ),
                          Text("English")
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
                                  AssetImage("Assets/Images/hist.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("History")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/health.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Health Science")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/geo.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Geography")
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
                                  AssetImage("Assets/Images/ict.png"),
                              radius: 30,
                            ),
                          ),
                          Text("ICT")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/civi.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Civics")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/art.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Arts")
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
                                  AssetImage("Assets/Images/pts.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("PTS")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/sinhala.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Sinhala")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/comm.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Commerce")
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
                                  AssetImage("Assets/Images/sinhala.jpg"),
                              radius: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text("2nd Language Sinhala"),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/tam.png"),
                              radius: 30,
                            ),
                          ),
                          Text("2nd Language Tamil")
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
                                      builder: (context) => OLsubjects()));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/sinhala.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Sinhala Literary")
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
                                  AssetImage("Assets/Images/buddhism.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Buddhism")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/sinhala.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Sinhala Language")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/music.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Music")
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
