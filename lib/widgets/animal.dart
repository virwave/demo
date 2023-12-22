import 'package:flutter/material.dart';
import 'animals_data.dart'; // Import your AnimalData class and animalsData list
import 'common_buttons.dart'; // Import your CommonButtons widget
import 'common_buttons_animals.dart'; // Import your CommonAnimalButtons widget
import 'sleep.dart'; // Import for SleepPage

class AnimalPage extends StatelessWidget {
  final String animalName;

  const AnimalPage({Key? key, required this.animalName}) : super(key: key);

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
        title: Text(animalName),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(animalData?.backgroundImagePath ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: animalData != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      animalData.imagePath,
                      width: 100,
                      height: 100,
                    ),
                    Text('Name: ${animalData.name}'),
                    // Add more Text widgets for additional details if available
                  ],
                )
              : Text('Not found'),
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
        height: 80, // Adjust the height as needed
        child: CommonAnimalButtons(
          onSleepPressed: () {
            if (animalData != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SleepPage(animalName: animalData.name),
                ),
              );
            }
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
