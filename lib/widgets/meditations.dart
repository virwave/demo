import 'package:flutter/material.dart';
import 'duration_selection.dart';
import 'meditations_data.dart';

class MeditationsPage extends StatelessWidget {
  const MeditationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditations'),
      ),
      body: ListView(
        children: MeditationsData.meditations
            .map((meditation) => buildMeditationItem(context, meditation))
            .toList(),
      ),
    );
  }

  void _showDurationPopup(BuildContext context, Meditation meditation) async {
    Duration selectedDuration = Duration(seconds: 30);

    final duration = await Navigator.push<Duration>(
      context,
      MaterialPageRoute(builder: (context) => DurationSelectionPage()),
    );

    if (duration != null) {
      selectedDuration = duration;
      _navigateWithDuration(context, meditation, selectedDuration);
    }
  }

  void _navigateWithDuration(
      BuildContext context, Meditation meditation, Duration duration) {
    print(
        'Selected Duration: ${duration.inSeconds} seconds for ${meditation.title}');
    Navigator.pop(context);

    navigateToMeditationPage(context, meditation.id, duration);
  }

  Widget buildMeditationItem(BuildContext context, Meditation meditation) {
    return GestureDetector(
      onTap: () {
        _showDurationPopup(context, meditation);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              meditation.imageUrl,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 8.0),
            Text(
              meditation.title,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToMeditationPage(
      BuildContext context, int meditationId, Duration duration) {
    // Replace with your logic to navigate to respective meditation pages based on IDs
    String routeName = '/meditation_$meditationId';
    Navigator.pushNamed(context, routeName, arguments: duration);
  }
}
