import 'package:flutter/material.dart';

import 'package:jitsist/HomeScreen/Home.dart';
import 'package:jitsist/Payment&Booking/BookedClasses.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[HomeScreen(), BookedClass()];

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
                backgroundColor: Color(0xff00007c)),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('Booked Classes'),
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
