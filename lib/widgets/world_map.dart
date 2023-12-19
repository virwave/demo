import 'package:flutter/material.dart';
import 'common_buttons.dart';
import 'settings.dart';

// Import AnimalPage
class WorldMap extends StatelessWidget {
  const WorldMap({Key? key}) : super(key: key);

  void onHomePressed(BuildContext context) {
    // Add logic for Home button
  }

  void onSettingsPressed(BuildContext context) {
    // Navigate to SettingsPage
  }

  void onHeartPressed(BuildContext context) {
    // Add logic for Heart button
  }

  void navigateToAnimalPage(BuildContext context, String animalName) {
    Navigator.pushNamed(
      context,
      '/animal',
      arguments: {'animalName': animalName},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // World Map or Background Image
          GestureDetector(
            onTap: () {
              navigateToAnimalPage(context, 'Axolotl');
            },
            child: Image.asset(
              'assets/images/animal_map.jpg', // Replace with your world map image asset path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Common Buttons Positioned on the screen
          CommonButtons(
            onHomePressed: () => onHomePressed(context),
            onSettingsPressed: () => onSettingsPressed(context),
            onHeartPressed: () => onHeartPressed(context),
          ),
          // Axolotl Image Positioned 25% from the left
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25 - 45,
            top: MediaQuery.of(context).size.height * 0.5 - 45,
            child: GestureDetector(
              onTap: () {
                navigateToAnimalPage(context, 'Axolotl');
              },
              child: Image.asset(
                'assets/images/animals/animal/axolotl.png',
                width: 90,
                height: 90,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
