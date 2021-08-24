import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 80),
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/Images/bg11.png'),
                    fit: BoxFit.cover),
                color: Color(0xff00007c),

                /*  boxShadow: [
                          BoxShadow(
                            color: Color(0xAA6EB1E6),
                            offset: Offset(9, 9),
                            blurRadius: 6,
                          ),
                        ],*/
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(widget.title,
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _controller.value.isInitialized
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
