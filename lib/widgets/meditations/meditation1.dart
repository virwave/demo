import 'package:flutter/material.dart';
import 'package:flutter_virwave/widgets/meditations_data.dart'; // Import your data file

class Meditation1Page extends StatelessWidget {
  const Meditation1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Meditation meditation =
        MeditationsData.meditations.firstWhere((med) => med.id == 1);

    return Scaffold(
      appBar: AppBar(
        title: Text(meditation.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              meditation.imageUrl,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16.0),
            Text(
              meditation.title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              meditation.description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
