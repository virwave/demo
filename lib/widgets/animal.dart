import 'package:flutter/material.dart';
import 'animal_data.dart'; // Ensure this file has the AnimalData class

class AnimalPage extends StatefulWidget {
  final String animalName;

  const AnimalPage({Key? key, required this.animalName}) : super(key: key);

  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  late AnimalData animalData;
  bool isSleeping = false;
  String activityImage = '';

  @override
  void initState() {
    super.initState();
    animalData = getAnimalData(widget.animalName);
    activityImage = animalData.imagePath; // Default image
  }

  AnimalData getAnimalData(String name) {
    return animalsData.firstWhere(
      (animal) => animal.name.toLowerCase() == name.toLowerCase(),
      orElse: () => AnimalData(
        name: '',
        imagePath: '',
        sleepImagePath: '',
        eatImagePath: '',
        backgroundImagePath: '',
        activities: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(animalData.name)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSleeping = !isSleeping;
                      activityImage = isSleeping
                          ? animalData.sleepImagePath
                          : animalData.imagePath;
                    });
                  },
                  child: Image.asset(
                    activityImage,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ...animalData.activities.map((activity) {
                return ActivityButton(
                  label: activity,
                  onPressed: () {
                    setState(() {
                      switch (activity) {
                        case 'Sleep':
                          isSleeping = !isSleeping;
                          activityImage = isSleeping
                              ? animalData.sleepImagePath
                              : animalData.imagePath;
                          break;
                        case 'Wash':
                          // Update for 'Wash' activity
                          break;
                        case 'Eat':
                          // Update for 'Eat' activity
                          break;
                        case 'Edu':
                          // Update for 'Edu' activity
                          break;
                        case 'Play':
                          // Update for 'Play' activity
                          break;
                        default:
                          break;
                      }
                    });
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const ActivityButton({Key? key, required this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
