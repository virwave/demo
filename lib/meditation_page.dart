// meditation_page.dart

import 'package:flutter/material.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation Page'),
      ),
      body: const Center(
        child: Text('Meditation sessions go here.'),
      ),
    );
  }
}
