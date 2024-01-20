import 'package:flutter/material.dart';
import 'common_buttons.dart';

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
          // GestureDetector for the world map, excluding specific animal areas
          GestureDetector(
            onTap: () {
              // Add logic if needed for tapping on the world map
            },
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/animal_map.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                // Other animal images positioned on the screen
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
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.5 - 15,
                  top: MediaQuery.of(context).size.height * 0.4 - 15,
                  child: GestureDetector(
                    onTap: () {
                      navigateToAnimalPage(context, 'Cheetah');
                    },
                    child: Image.asset(
                      'assets/images/animals/animal/cheetah.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                // Add more animal images as needed
              ],
            ),
          ),
          // Common Buttons Positioned on the screen
          CommonButtons(
            onHomePressed: () => onHomePressed(context),
            onSettingsPressed: () => onSettingsPressed(context),
            onHeartPressed: () => onHeartPressed(context),
          ),
        ],
      ),
    );
  }
}
