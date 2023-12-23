import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class Meditation2Page extends StatefulWidget {
  final int meditationId;

  const Meditation2Page({Key? key, required this.meditationId})
      : super(key: key);

  @override
  _Meditation2PageState createState() => _Meditation2PageState();
}

class _Meditation2PageState extends State<Meditation2Page> {
  late Offset _virwavePosition;
  late Timer _timer;
  bool _isMoving = true;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _virwavePosition = _getRandomPosition();
      _startMoving();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Offset _getRandomPosition() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double randomX = _random.nextDouble() * screenWidth;
    final double randomY = _random.nextDouble() * screenHeight;

    return Offset(randomX, randomY);
  }

  void _startMoving() {
    _timer = Timer.periodic(Duration(milliseconds: 1200), (timer) {
      if (_isMoving) {
        setState(() {
          _virwavePosition = _getRandomPosition();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation ${widget.meditationId}'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isMoving = !_isMoving;
          });
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              left: _virwavePosition.dx,
              top: _virwavePosition.dy,
              child: Image.asset(
                'assets/images/icons/virwave_logo.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
