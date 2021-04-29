import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final int index;

  DetailsPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('The details page #$index'),
      ),
    );
  }
}
