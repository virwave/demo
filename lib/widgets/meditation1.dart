import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Meditation1Page extends StatefulWidget {
  const Meditation1Page({Key? key}) : super(key: key);

  @override
  _Meditation1PageState createState() => _Meditation1PageState();
}

class _Meditation1PageState extends State<Meditation1Page> {
  late VideoPlayerController _controller;
  bool _videoStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'assets/videos/meditation1.mp4',
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation 1'),
      ),
      body: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(),
          ),
          if (!_videoStarted)
            Draggable(
              feedback: Image.asset('assets/images/icons/virwave_logo.png',
                  width: 100, height: 100),
              child: Image.asset('assets/images/icons/virwave_logo.png',
                  width: 100, height: 100),
              onDragEnd: (details) async {
                await Future.delayed(Duration(milliseconds: 300));
                setState(() {
                  _videoStarted = true;
                  _controller.play();
                });
              },
            ),
        ],
      ),
    );
  }
}
