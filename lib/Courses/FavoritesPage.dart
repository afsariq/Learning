import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff00007c),
        title: Text('Favorites'),
      ),
    );
  }
}
