import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onHomePressed;
  final VoidCallback? onHeartPressed; // Callback for pressing the heart icon

  const CommonButtons({
    Key? key,
    this.onSettingsPressed,
    this.onHomePressed,
    this.onHeartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            icon: Image.asset(
              'assets/images/icons/virwave_logo.png',
              width: 90,
              height: 90,
            ),
            onPressed: () {
              // Action when logo icon is pressed
            },
          ),
        ),
        Positioned(
          top: 20,
          left: 130,
          child: IconButton(
            icon: const Icon(
              Icons.home,
              size: 90,
            ),
            onPressed: onHomePressed,
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: IconButton(
            icon: const Icon(
              Icons.settings,
              size: 90,
            ),
            onPressed: onSettingsPressed,
          ),
        ),
        Positioned(
          top: 20,
          right: 130,
          child: IconButton(
            icon: Image.asset(
              'assets/images/icons/heart_100.png',
              width: 90,
              height: 90,
            ),
            onPressed: onHeartPressed,
          ),
        ),
      ],
    );
  }
}
