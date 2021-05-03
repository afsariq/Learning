import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final int index;

  DetailsPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios),
        elevation: 0.0,
      ),
      body:Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, 
                      offset: Offset(0.0, 2.0), 
                      blurRadius: 6.0)
                      ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Course Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      '40 minutes',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
