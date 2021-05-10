import 'package:flutter/material.dart';

class scienceStream extends StatelessWidget {
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
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/math.png"),
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
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/phy.jpg"),
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
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/chem.jpg"),
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
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/ict.png"),
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
