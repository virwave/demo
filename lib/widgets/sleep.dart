import 'package:flutter/material.dart';
import 'animals_data.dart'; // Import your AnimalData class and animalsData list
import 'common_buttons.dart'; // Import your CommonButtons widget
import 'common_buttons_animals.dart'; // Import your CommonAnimalButtons widget

class SleepPage extends StatelessWidget {
  final String animalName;

  const SleepPage({Key? key, required this.animalName}) : super(key: key);

  AnimalData? findAnimalData() {
    try {
      return animalsData.firstWhere(
        (animal) => animal.name.toLowerCase() == animalName.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final AnimalData? animalData = findAnimalData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Page'), // Update the title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (animalData != null)
              Image.asset(
                animalData
                    .sleepImagePath, // Use the sleepImagePath for the image
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            // Add more widgets or content for the SleepPage
            // Example: Text('Sleeping information'),
          ],
        ),
      ),
      floatingActionButton: CommonButtons(
        onHomePressed: () {
          // Implement logic for home button press
        },
        onSettingsPressed: () {
          // Implement logic for settings button press
        },
        onHeartPressed: () {
          // Implement logic for heart button press
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: CommonAnimalButtons(
          onSleepPressed: () {
            // Navigate back to the previous page (AnimalPage)
            Navigator.pop(context);
          },
          onWashPressed: () {
            // Implement wash action
          },
          onEatPressed: () {
            // Implement eat action
          },
          onEduPressed: () {
            // Implement education action
          },
          onPlayPressed: () {
            // Implement play action
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
