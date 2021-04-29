import 'package:flutter/material.dart';

class Maths extends StatelessWidget {
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
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "On demand Teachers",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 175,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 140,
                        child: Card(
                            child: Stack(children: [
                          Positioned(
                              //top: 10,
                              child: Image.asset("Assets/Images/logo.png")),
                          Positioned(
                            top: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          )
                        ])),
                      ),
                      Container(
                        width: 140,
                        child: Card(
                            child: Stack(children: [
                          Positioned(
                              //top: 10,
                              child: Image.asset("Assets/Images/logo.png")),
                          Positioned(
                            top: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          )
                        ])),
                      ),
                      Container(
                        width: 140,
                        child: Card(
                            child: Stack(children: [
                          Positioned(
                              //top: 10,
                              child: Image.asset("Assets/Images/logo.png")),
                          Positioned(
                            top: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          )
                        ])),
                      ),
                      Container(
                        width: 140,
                        child: Card(
                            child: Stack(children: [
                          Positioned(
                              //top: 10,
                              child: Image.asset("Assets/Images/logo.png")),
                          Positioned(
                            top: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          )
                        ])),
                      ),
                    ],
                  )),
            ],
          ),
        ]));
  }
}
