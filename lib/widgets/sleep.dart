import 'package:flutter/material.dart';
import 'animals_data.dart'; // Replace with your animal data import
import 'common_buttons.dart'; // Replace with your common buttons import
import 'common_buttons_animals.dart'; // Replace with your common animal buttons import

class SleepPage extends StatefulWidget {
  final String animalName;

  const SleepPage({Key? key, required this.animalName}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  late AnimalData? _animalData;
  bool _isOnBed = false;

  @override
  void initState() {
    super.initState();
    _animalData = findAnimalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Page'),
      ),
      body: Center(
        child: Stack(
          children: [
            // Bed Image (DragTarget)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: MediaQuery.of(context).size.width * 0.4,
              child: DragTarget<AnimalData>(
                builder: (context, candidateAnimals, rejectedAnimals) {
                  return Image.asset(
                    'assets/images/icons/smile.png', // Replace with your bed image path
                    width: 100,
                    height: 100,
                  );
                },
                onWillAccept: (data) =>
                    true, // Allow dropping the animal on the bed
                onAccept: (animal) {
                  setState(() {
                    _isOnBed = true;
                  });
                },
              ),
            ),
            // Animal Image (Draggable)
            Positioned(
              left: _isOnBed
                  ? MediaQuery.of(context).size.width * 0.5
                  : MediaQuery.of(context).size.width * 0.2,
              top: _isOnBed
                  ? MediaQuery.of(context).size.height * 0.5
                  : MediaQuery.of(context).size.height * 0.2,
              child: Draggable<AnimalData>(
                data: _animalData!,
                child: _isOnBed
                    ? Opacity(
                        opacity: 0.0,
                        child: Image.asset(
                          _animalData!.imagePath,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Image.asset(
                        _animalData!.imagePath, // Regular image of the animal
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                feedback: Image.asset(
                  _animalData!
                      .imagePath, // Regular image as feedback when dragging
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                childWhenDragging: Container(),
                onDraggableCanceled: (_, __) {},
              ),
            ),
            // Sleeping Animal Image (Visible when on the bed)
            if (_isOnBed)
              Center(
                child: Image.asset(
                  _animalData!
                      .sleepImagePath, // Show sleeping image when the animal is on the bed
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: CommonButtons(
          // Existing logic for common buttons
          ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: CommonAnimalButtons(
            // Existing logic for common animal buttons
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AnimalData? findAnimalData() {
    try {
      return animalsData.firstWhere(
        (animal) =>
            animal.name.toLowerCase() == widget.animalName.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
