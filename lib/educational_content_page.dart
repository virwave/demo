// educational_content_page.dart

import 'package:flutter/material.dart';

class EducationalContentPage extends StatelessWidget {
  const EducationalContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational Content'),
      ),
      body: const Center(
        child: Text('Educational materials go here.'),
      ),
    );
  }
}
