import 'package:flutter/material.dart';

class CommonAnimalButtons extends StatelessWidget {
  final VoidCallback? onSleepPressed;
  final VoidCallback? onWashPressed;
  final VoidCallback? onEatPressed;
  final VoidCallback? onEduPressed;
  final VoidCallback? onPlayPressed;
  final bool isOnSleepPage;

  const CommonAnimalButtons({
    Key? key,
    this.onSleepPressed,
    this.onWashPressed,
    this.onEatPressed,
    this.onEduPressed,
    this.onPlayPressed,
    required this.isOnSleepPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Background color for the bottom buttons
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/images/icons/sleep.png',
              width: 60,
              height: 60,
            ),
            onPressed: onSleepPressed,
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/icons/wash.png',
              width: 60,
              height: 60,
            ),
            onPressed: onWashPressed,
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/icons/eat.png',
              width: 60,
              height: 60,
            ),
            onPressed: onEatPressed,
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/icons/edu.png',
              width: 60,
              height: 60,
            ),
            onPressed: onEduPressed,
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/icons/play.png',
              width: 60,
              height: 60,
            ),
            onPressed: onPlayPressed,
          ),
        ],
      ),
    );
  }
}
