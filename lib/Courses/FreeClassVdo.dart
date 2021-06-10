import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FreeClassVideo extends StatefulWidget {
  //FreeClassVideo() : super();

  //final String title;

  String title;

  String vdoLink;
  FreeClassVideo({
    @required this.vdoLink,
    @required this.title,
  });

  @override
  _FreeClassVideoState createState() => _FreeClassVideoState();
}

class _FreeClassVideoState extends State<FreeClassVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.vdoLink)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff00007c),
          title: Text(widget.title),
        ),
        body: ListView(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _controller.value.initialized
                    ? AspectRatio(
                        aspectRatio: 1 / 1.6,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                      color: Color(0xff00007c),
                      borderRadius: BorderRadius.all(Radius.circular(90))),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
