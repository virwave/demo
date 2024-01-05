class AnimalData {
  final String name;
  final String imagePath;
  final String sleepImagePath;
  final String eatImagePath;
  final String backgroundImagePath;
  final List<String> activities; // Add activities property

  AnimalData({
    required this.name,
    required this.imagePath,
    required this.sleepImagePath,
    required this.eatImagePath,
    required this.backgroundImagePath,
    required this.activities, // Initialize activities
  });
}

List<AnimalData> animalsData = [
  AnimalData(
    name: 'Axolotl',
    imagePath: 'assets/images/animals/animal/axolotl.png',
    sleepImagePath: 'assets/images/animals/sleep/axolotl_sleep.png',
    eatImagePath: 'assets/images/animals/eat/axolotl_eat.png',
    backgroundImagePath: 'assets/images/animals/background/axolotl_bg.png',
    activities: [
      'Sleep',
      'Wash',
      'Eat',
      'Edu',
      'Play'
    ], // Initialize activities
  ),
  // Add data for other animals here
];
