// animal.dart

import 'package:flutter/material.dart';
import 'animal_data.dart'; // Import your AnimalData class
import 'axolotl_play.dart'; // Import the AxolotlPlayPage
import 'activity_util.dart'; // Import the ActivityUtil

class AnimalPage extends StatefulWidget {
  final String animalName;

  const AnimalPage({Key? key, required this.animalName}) : super(key: key);

  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  late AnimalData animalData;
  String currentActivity = 'Default';

  @override
  void initState() {
    super.initState();
    animalData = getAnimalData(widget.animalName);
  }

  AnimalData getAnimalData(String name) {
    return animalsData.firstWhere(
      (animal) => animal.name.toLowerCase() == name.toLowerCase(),
      orElse: () => AnimalData(
        name: '',
        imagePath: '',
        sleepImagePath: '',
        washImagePath: '',
        eatImagePath: '',
        eduImagePath: "",
        playImagePath: "",
        backgroundImagePath: '',
      ),
    );
  }

  void setActivity(String activity) {
    setState(() {
      if (currentActivity == activity) {
        // If the same button is pressed again, revert to default
        currentActivity = 'Default';
      } else {
        currentActivity = activity;
      }
    });
  }

  String getActivityImage() {
    switch (currentActivity) {
      case 'Sleep':
        return animalData.sleepImagePath;
      case 'Wash':
        return animalData.washImagePath;
      case 'Eat':
        return animalData.eatImagePath;
      case 'Edu':
        return animalData.eduImagePath;
      case 'Play':
        return animalData.playImagePath;
      default:
        return animalData.imagePath;
    }
  }

  @override
  Widget build(BuildContext context) {
    String activityImage = getActivityImage();
    String backgroundImage =
        animalData.backgroundImagePath; // Get the background image path

    return Scaffold(
      appBar: AppBar(title: Text(animalData.name)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage), // Use the background image path
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: Center(
          child: Image.asset(
            activityImage,
            width: 150,
            height: 150,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () =>
                  ActivityUtil.handleActivity(context, 'Sleep', animalData),
              child: Text('Sleep'), // Replace with icon or label
            ),
            ElevatedButton(
              onPressed: () =>
                  ActivityUtil.handleActivity(context, 'Wash', animalData),
              child: Text('Wash'), // Replace with icon or label
            ),
            ElevatedButton(
              onPressed: () =>
                  ActivityUtil.handleActivity(context, 'Eat', animalData),
              child: Text('Eat'), // Replace with icon or label
            ),
            ElevatedButton(
              onPressed: () =>
                  ActivityUtil.handleActivity(context, 'Edu', animalData),
              child: Text('Edu'), // Replace with icon or label
            ),
            ElevatedButton(
              onPressed: () =>
                  ActivityUtil.handleActivity(context, 'Play', animalData),
              child: Text('Play'), // Replace with icon or label
            ),
          ],
        ),
      ),
    );
  }
}
