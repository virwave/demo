// parental_controls_page.dart

import 'package:flutter/material.dart';

class ParentalControlsPage extends StatelessWidget {
  const ParentalControlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parental Controls'),
      ),
      body: const Center(
        child: Text('Parental control settings go here.'),
      ),
    );
  }
}
