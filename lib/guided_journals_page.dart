// guided_journals_page.dart

import 'package:flutter/material.dart';

class GuidedJournalsPage extends StatelessWidget {
  const GuidedJournalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guided Journals'),
      ),
      body: const Center(
        child: Text('Space for guided journals and reflections.'),
      ),
    );
  }
}
