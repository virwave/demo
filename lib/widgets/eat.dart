import 'package:flutter/material.dart';
import 'animals_data.dart'; // Import your AnimalData class and animalsData list
import 'common_buttons.dart'; // Import your CommonButtons widget
import 'common_buttons_animals.dart'; // Import your CommonAnimalButtons widget

class EatPage extends StatelessWidget {
  final String animalName;

  const EatPage({Key? key, required this.animalName}) : super(key: key);

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
        title: const Text('Eat Page'), // Update the title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (animalData != null)
              Image.asset(
                animalData.eatImagePath, // Use the eatImagePath for the image
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            // Add more widgets or content for the EatPage
            // Example: Text('Eating information'),
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
            // Implement sleep action
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
