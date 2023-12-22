import 'package:flutter/material.dart';
import 'meditations_data.dart'; // Import the meditations data file

class MeditationsPage extends StatelessWidget {
  const MeditationsPage({Key? key}) : super(key: key);

  void showDurationSelection(BuildContext context, int meditationId) {
    Duration selectedDuration = const Duration(seconds: 5); // Initial value

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Duration'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Slider(
                    min: 5,
                    max: 8 * 60, // 8 minutes in seconds
                    value: selectedDuration.inSeconds.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        selectedDuration = Duration(seconds: value.toInt());
                      });
                    },
                    divisions: ((8 * 60) - 5).toInt(),
                    label:
                        '${selectedDuration.inMinutes}:${selectedDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                      navigateToMeditation(
                          context, meditationId, selectedDuration);
                    },
                    child: Text('Next'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void navigateToMeditation(
      BuildContext context, int meditationId, Duration duration) {
    switch (meditationId) {
      case 1:
        Navigator.pushNamed(
          context,
          '/meditation1',
          arguments: duration, // Pass duration as an argument if needed
        );
        break;
      case 2:
        Navigator.pushNamed(
          context,
          '/meditation2',
          arguments: duration, // Pass duration as an argument if needed
        );
        break;
      // Add more cases for other meditation IDs as necessary
      default:
        // Handle cases for other meditations or show an error message
        break;
    }
  }

  Widget buildMeditationItem(BuildContext context, Meditation meditation) {
    return GestureDetector(
      onTap: () {
        showDurationSelection(context, meditation.id);
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

  Widget buildMeditationShelf(
      BuildContext context, List<Meditation> shelfMeditations) {
    List<Widget> meditationItems = [];
    for (int i = 0; i < shelfMeditations.length; i++) {
      Meditation meditation = shelfMeditations[i];
      meditationItems.add(buildMeditationItem(context, meditation));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: meditationItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> shelves = [];
    int numberOfShelves = (MeditationsData.meditations.length / 4).ceil();

    for (int i = 0; i < numberOfShelves; i++) {
      int start = i * 4;
      int end = (i + 1) * 4;
      if (end > MeditationsData.meditations.length) {
        end = MeditationsData.meditations.length;
      }
      List<Meditation> shelfMeditations =
          MeditationsData.meditations.sublist(start, end);
      shelves.add(buildMeditationShelf(context, shelfMeditations));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Meditations'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: shelves,
            ),
          ),
        ],
      ),
    );
  }
}
