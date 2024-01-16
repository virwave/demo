import 'package:flutter/material.dart';
import 'animal_data.dart'; // Import your AnimalData class

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
        activities: [],
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

    return Scaffold(
      appBar: AppBar(title: Text(animalData.name)),
      body: Center(
        child: Image.asset(
          activityImage,
          width: 150,
          height: 150,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActivityButton(
              onPressed: () => setActivity('Sleep'),
              iconImage: Image.asset('assets/images/icons/sleep.png'),
              iconSize: 40.0, // Adjust the size as needed
            ),
            ActivityButton(
              label: 'Wash',
              onPressed: () => setActivity('Wash'),
            ),
            ActivityButton(
              label: 'Eat',
              onPressed: () => setActivity('Eat'),
            ),
            ActivityButton(
              label: 'Edu',
              onPressed: () => setActivity('Edu'),
            ),
            ActivityButton(
              label: 'Play',
              onPressed: () => setActivity('Play'),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Image? iconImage;
  final IconData? iconData;
  final String? label;
  final double iconSize;

  const ActivityButton({
    Key? key,
    this.onPressed,
    this.iconImage,
    this.iconData,
    this.label,
    this.iconSize = 24.0, // Default size for icons
  })  : assert(
            (iconImage != null ? 1 : 0) +
                    (iconData != null ? 1 : 0) +
                    (label != null ? 1 : 0) ==
                1,
            'Only one of iconImage, iconData, or label should be provided.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonChild;
    if (iconImage != null) {
      buttonChild = SizedBox(
        width: iconSize,
        height: iconSize,
        child: iconImage,
      );
    } else if (iconData != null) {
      buttonChild = Icon(iconData, size: iconSize);
    } else if (label != null) {
      buttonChild = Text(label!);
    } else {
      throw ArgumentError('An icon, image, or label must be provided');
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: buttonChild,
    );
  }
}
