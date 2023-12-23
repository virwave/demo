import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Meditation1Page extends StatefulWidget {
  const Meditation1Page({Key? key, required int meditationId})
      : super(key: key);

  @override
  _Meditation1PageState createState() => _Meditation1PageState();
}

class _Meditation1PageState extends State<Meditation1Page> {
  late VideoPlayerController _controller;
  bool _videoStarted = false;
  Offset _virwavePosition = Offset(0, 0);

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
          // Video Player
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(),
          ),

          // Logo Positioned Over Video
          Positioned(
            left: _virwavePosition.dx,
            top: _virwavePosition.dy,
            child: Draggable(
              feedback: Image.asset('assets/images/icons/virwave_logo.png',
                  width: 100, height: 100),
              child: Image.asset('assets/images/icons/virwave_logo.png',
                  width: 100, height: 100),
              onDragEnd: (details) {
                setState(() {
                  _virwavePosition = details.offset;
                });
                // Start the video after a delay once the logo is moved
                Future.delayed(Duration(milliseconds: 300), () {
                  if (!_videoStarted) {
                    setState(() {
                      _videoStarted = true;
                      _controller.play();
                    });
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
