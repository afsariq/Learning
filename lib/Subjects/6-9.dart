import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
import 'package:jitsist/Subjects/Subjects.dart';
import 'package:jitsist/Subjects/SubjectsNew.dart';

class sixtoeleven extends StatelessWidget {
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
                        child: Text('Grade 6-9',
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Maths',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/mathsf.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Science',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/Advanced.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'English',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/englishf.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'History',
                                          )));
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
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Health Science',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/healthf.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Geography',
                                          )));
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
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'ICT',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/ictf.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Civics',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/FreeClass.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Arts',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/artf.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'PTS',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/phyf.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Sinhala',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/sinhalaf.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Commerce',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/commf.png"),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: '2nd Language Sinhala',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/2ndf.png"),
                              radius: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text("Sinhala 2        "),
                          )
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
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: '2nd Language Tamil',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/tamilf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Tamil 2")
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
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Sinhala Literary',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/Schol.png"),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Buddhism',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/budhf.png"),
                              radius: 30,
                            ),
                          ),
                          Text("Buddhism")
                        ],
                      ),
                    ),
                    /* Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Subject(
                                            cls: '6-9',
                                            sub: 'Sinhala Language',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/sinhala.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Sinhala Language")
                        ],
                      ),
                    ),*/
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectNew(
                                            cls: '6-9',
                                            sub: 'Music',
                                          )));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("Assets/Images/musicf.png"),
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
