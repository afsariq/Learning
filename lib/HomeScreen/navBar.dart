import 'package:flutter/material.dart';
import 'package:jitsi/CalendarScreen/Calendar.dart';
import 'package:jitsi/HomeScreen/Home.dart';
import 'package:jitsi/VideoCall/Video.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Video(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Color(0xff00007c),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule),
                title: Text('Calendar'),
                backgroundColor: Color(0xff00007c)),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
