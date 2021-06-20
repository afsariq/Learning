import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:intl/intl.dart';

class MyApp extends StatelessWidget {
  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          /* body: const WebView(
            initialUrl: 'http://africau.edu/images/default/sample.pdf',
            javascriptMode: JavascriptMode.unrestricted,
          ),*/

          body: RaisedButton(onPressed: () {
            print(date
                .toString()); // prints something like 2019-12-10 10:02:22.287949
            print(DateFormat('EEEE').format(date)); // prints Tuesday
            print(DateFormat('EEEE, d MMM, yyyy')
                .format(date)); // prints Tuesday, 10 Dec, 2019
            print(DateFormat('h:mm a').format(date));

            var now = new DateTime.now();
            var berlinWallFellDate = new DateTime.utc(2021, 06, 19);
// 0 denotes being equal positive value greater and negative value being less

            if (berlinWallFellDate.isAfter(now)) {
              print("done");
            } else {
              print("not done");
            }
          }),
        ));
  }
}
