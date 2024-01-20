import 'package:flutter/material.dart';
import 'animal_data.dart'; // Import your AnimalData class

class AxolotlPlayPage extends StatefulWidget {
  final AnimalData animalData;

  const AxolotlPlayPage({Key? key, required this.animalData}) : super(key: key);

  @override
  _AxolotlPlayPageState createState() => _AxolotlPlayPageState();
}

class _AxolotlPlayPageState extends State<AxolotlPlayPage> {
  int score = 0; // Variable to keep track of the player's score

  @override
  Widget build(BuildContext context) {
    // Build the UI and functionality specific to the Axolotl's play game
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
            // Game UI elements (e.g., bubbles to pop)
            GestureDetector(
              onTap: () {
                // When a bubble is tapped, increase the score
                setState(() {
                  score += 10;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Bubble',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
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
