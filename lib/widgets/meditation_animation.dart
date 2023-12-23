import 'package:flutter/material.dart';
import 'meditations_data.dart'; // Import the meditations data file

class MeditationAnimationScreen extends StatefulWidget {
  final Meditation meditation;

  const MeditationAnimationScreen({Key? key, required this.meditation})
      : super(key: key);

  @override
  _MeditationAnimationScreenState createState() =>
      _MeditationAnimationScreenState();
}

class _MeditationAnimationScreenState extends State<MeditationAnimationScreen> {
  double _opacity = 1.0;
  Offset _logoPosition = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meditation.title),
      ),
      body: Stack(
        children: [
          // Your meditation content
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _opacity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.meditation.imageUrl,
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.meditation.title,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  // Add other content for the meditation
                  Text(
                    widget.meditation.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          // Draggable logo
          Positioned(
            left: _logoPosition.dx,
            top: _logoPosition.dy,
            child: Draggable(
              child: Image.asset(
                'assets/images/icons/virwave_logo.png', // Update with your path
                width: 50,
                height: 50,
              ),
              feedback: Image.asset(
                'assets/images/icons/virwave_logo.png', // Update with your path
                width: 50,
                height: 50,
              ),
              onDraggableCanceled: (Velocity velocity, Offset offset) {
                setState(() {
                  _logoPosition = offset;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
