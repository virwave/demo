// games_page.dart

import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games Page'),
      ),
      body: const Center(
        child: Text('Interactive and educational games go here.'),
      ),
    );
  }
}
