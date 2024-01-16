import 'package:flutter/material.dart';
import 'animal_data.dart'; // Ensure this file has the AnimalData class

class AnimalActionsBar extends StatelessWidget {
  final VoidCallback onSleep;
  final VoidCallback onWash;
  final VoidCallback onEat;
  final VoidCallback onEdu;
  final VoidCallback onPlay;

  const AnimalActionsBar({
    Key? key,
    required this.onSleep,
    required this.onWash,
    required this.onEat,
    required this.onEdu,
    required this.onPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.night_shelter),
            onPressed: onSleep,
          ),
          IconButton(
            icon: Icon(Icons.shower),
            onPressed: onWash,
          ),
          IconButton(
            icon: Icon(Icons.fastfood),
            onPressed: onEat,
          ),
          IconButton(
            icon: Icon(Icons.school),
            onPressed: onEdu,
          ),
          IconButton(
            icon: Icon(Icons.sports_soccer),
            onPressed: onPlay,
          ),
        ],
      ),
    );
  }
}
