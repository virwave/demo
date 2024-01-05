import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onHomePressed;
  final VoidCallback? onHeartPressed;

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
              // Navigate to MeditationsPage
              Navigator.pushNamed(context, '/meditations');
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
            onPressed: () {
              // Navigate to WorldMap page
              Navigator.pushNamed(context, '/home');
            },
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
            onPressed: () {
              // Show settings dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Settings'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Setting 1'),
                          Text('Setting 2'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
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
