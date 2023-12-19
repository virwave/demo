import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final bool initiatedFromWorldMap;

  const SettingsPage({Key? key, this.initiatedFromWorldMap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              initiatedFromWorldMap
                  ? 'Settings initiated from World Map!'
                  : 'Normal Settings Page',
              style: const TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
            ),
            // Add your settings widgets below this line
          ],
        ),
      ),
    );
  }
}
