import 'package:flutter/material.dart';

class CommonAnimalButtons extends StatelessWidget {
  final VoidCallback? onSleepPressed;
  final VoidCallback? onWashPressed;
  final VoidCallback? onEatPressed;
  final VoidCallback? onEduPressed;
  final VoidCallback? onPlayPressed;

  const CommonAnimalButtons({
    Key? key,
    this.onSleepPressed,
    this.onWashPressed,
    this.onEatPressed,
    this.onEduPressed,
    this.onPlayPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            'assets/images/icons/smile.png',
            width: 60,
            height: 60,
          ),
          onPressed: onWashPressed,
        ),
        IconButton(
          icon: Image.asset(
            'assets/images/icons/smile.png',
            width: 60,
            height: 60,
          ),
          onPressed: onEatPressed,
        ),
        IconButton(
          icon: Image.asset(
            'assets/images/icons/smile.png',
            width: 60,
            height: 60,
          ),
          onPressed: onEduPressed,
        ),
        IconButton(
          icon: Image.asset(
            'assets/images/icons/smile.png',
            width: 60,
            height: 60,
          ),
          onPressed: onPlayPressed,
        ),
      ],
    );
  }
}
