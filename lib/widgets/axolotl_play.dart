import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter_virwave/widgets/animal_data.dart' as VirwaveAnimalData;

class AxolotlPlayPage extends StatefulWidget {
  final VirwaveAnimalData.AnimalData animalData;

  const AxolotlPlayPage({Key? key, required this.animalData}) : super(key: key);

  @override
  _AxolotlPlayPageState createState() => _AxolotlPlayPageState();
}

class _AxolotlPlayPageState extends State<AxolotlPlayPage> {
  int score = 0; // Variable to keep track of the player's score
  List<Offset> bubbles = [];
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _startGeneratingBubbles();
  }

  void _startGeneratingBubbles() {
    const duration = const Duration(seconds: 2);
    Timer.periodic(duration, (timer) {
      setState(() {
        bubbles.add(_getRandomPosition());
      });
    });
  }

  Offset _getRandomPosition() {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double randomX = _random.nextDouble() * screenWidth;

    return Offset(randomX, 0); // Start at the top of the screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.animalData.name + ' Play Game')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pop the Bubbles!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            // Display the bubbles on the screen
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Implement bubble popping logic here (remove the bubble)
                  setState(() {
                    bubbles.removeWhere((bubble) {
                      double bubbleTop = bubble.dy;
                      double bubbleBottom = bubble.dy + 50; // Bubble height
                      bool popped =
                          bubbleBottom >= MediaQuery.of(context).size.height;
                      if (popped) {
                        score +=
                            10; // Increase the score when a bubble is popped
                      }
                      return popped;
                    });
                  });
                },
                child: Stack(
                  children: [
                    for (var bubblePosition in bubbles)
                      Positioned(
                        left: bubblePosition.dx,
                        top: bubblePosition.dy,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Exit the game and return to the Axolotl page
                Navigator.pop(context);
              },
              child: Text('Exit Game'),
            ),
          ],
        ),
      ),
    );
  }
}
