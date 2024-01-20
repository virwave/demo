// activity_util.dart

import 'package:flutter/material.dart';
import 'animal_data.dart'; // Import your AnimalData class
import 'axolotl_play.dart'; // Import the AxolotlPlayPage

class ActivityUtil {
  static void handleActivity(
      BuildContext context, String activity, AnimalData animalData) {
    if (activity == 'Play') {
      // Navigate to the respective animal's play game page
      navigateToPlayGame(context, animalData);
    } else {
      // Handle other activities (Sleep, Wash, Eat, Edu, etc.)
      // Add your logic here for each activity
    }
  }

  static void navigateToPlayGame(BuildContext context, AnimalData animalData) {
    if (animalData.name == 'Axolotl') {
      // Navigate to the Axolotl Play Game Page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AxolotlPlayPage(animalData: animalData),
        ),
      );
    } else {
      // Handle other animals' play game pages (if needed)
      // Add logic for other animals' games here
    }
  }
}
