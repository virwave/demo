import 'package:flutter/material.dart';
import 'animals_data.dart';
import 'common_buttons.dart';
import 'common_buttons_animals.dart';

class SleepPage extends StatefulWidget {
  final String animalName;

  const SleepPage({Key? key, required this.animalName}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  bool isAnimalOnBed = false;

  @override
  Widget build(BuildContext context) {
    final AnimalData? animalData = findAnimalData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Page'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              right: 10,
              child: DragTarget<String>(
                builder: (BuildContext context, List<String?> candidateData,
                    List<dynamic> rejectedData) {
                  return Image.asset(
                    'assets/images/icons/smile.png', // Replace with your bed image path
                    width: 100,
                    height: 100,
                  );
                },
                onWillAccept: (data) => data == 'Animal',
                onAccept: (data) {
                  setState(() {
                    isAnimalOnBed = true;
                  });
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: 10,
              child: Draggable<String>(
                data: 'Animal',
                child: isAnimalOnBed
                    ? SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          animalData!.sleepImagePath,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Image.asset(
                        animalData!.sleepImagePath,
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                feedback: Image.asset(
                  animalData.sleepImagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                childWhenDragging: Container(),
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
