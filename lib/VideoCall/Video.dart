import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'dart:math';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

var no = new Random();
String abc = no.toString();
String abcd = '/learningApp.Join';
String abcde = 'http//LearningApp/Olecture.link/';
String link = abcde + abc + abcd;

class _VideoState extends State<Video> {
  final serverText = TextEditingController();
  final roomText = TextEditingController();
  final subjectText = TextEditingController(text: "Online Lecture");
  final nameText = TextEditingController(text: "Teacher");
  final emailText =
      TextEditingController(text: FirebaseAuth.instance.currentUser.email);
  var isAudioOnly = true;
  var isAudioMuted = true;
  var isVideoMuted = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lets Connect'),
          backgroundColor: Color(0xff00007c),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 24.0,
                ),
                TextField(
                  controller: serverText,
                  readOnly: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Server URL",
                      hintText: "*********************"),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextField(
                  controller: roomText,
                  //readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Room",
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextField(
                  controller: subjectText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Subject",
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextField(
                  controller: nameText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Display Name",
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  readOnly: true,
                ),
                SizedBox(
                  height: 5.0,
                ),
                CheckboxListTile(
                  title: Text("Audio Only"),
                  value: isAudioOnly,
                  onChanged: _onAudioOnlyChanged,
                ),
                SizedBox(
                  height: 5.0,
                ),
                CheckboxListTile(
                  title: Text("Audio Muted"),
                  value: isAudioMuted,
                  onChanged: _onAudioMutedChanged,
                ),
                SizedBox(
                  height: 5.0,
                ),
                CheckboxListTile(
                  title: Text("Video Muted"),
                  value: isVideoMuted,
                  onChanged: _onVideoMutedChanged,
                ),
                Divider(
                  height: 38.0,
                  thickness: 2.0,
                ),
                SizedBox(
                  height: 40.0,
                  width: 150,
                  child: RaisedButton(
                    onPressed: () {
                      _joinMeeting();
                    },
                    shape: StadiumBorder(),
                    child: Text(
                      "Join Meeting",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xff00007c),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onAudioOnlyChanged(bool value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  _onAudioMutedChanged(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  _onVideoMutedChanged(bool value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  _joinMeeting() async {
    String serverUrl =
        serverText.text?.trim()?.isEmpty ?? "" ? null : serverText.text;

    try {
      var options = JitsiMeetingOptions()
        ..room = roomText.text
        ..serverURL = serverUrl
        ..subject = subjectText.text
        ..userDisplayName = nameText.text
        ..userEmail = emailText.text
        ..audioOnly = isAudioOnly
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
