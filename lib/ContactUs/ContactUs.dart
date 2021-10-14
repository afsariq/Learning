import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appPhoneNumber = '+94716181818';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // padding: EdgeInsets.only(top: 100),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("Assets/Images/contactus.png"),
                      fit: BoxFit.fitHeight),
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'admin@eviduhala.lk',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                    primary: Color(0xff00007c),
                    textStyle: TextStyle(fontSize: 20)),
                child: Text('Call'),
                onPressed: () async {
                  launch('tel://$appPhoneNumber');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
