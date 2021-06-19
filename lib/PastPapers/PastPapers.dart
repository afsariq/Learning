import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          body: const WebView(
            initialUrl: 'http://africau.edu/images/default/sample.pdf',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
