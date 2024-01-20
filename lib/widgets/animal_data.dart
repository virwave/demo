class AnimalData {
  final String name;
  final String imagePath;
  final String sleepImagePath;
  final String washImagePath;
  final String eatImagePath;
  final String eduImagePath;
  final String playImagePath;
  final String backgroundImagePath;

  AnimalData({
    required this.name,
    required this.imagePath,
    required this.sleepImagePath,
    required this.washImagePath,
    required this.eatImagePath,
    required this.eduImagePath,
    required this.playImagePath,
    required this.backgroundImagePath,
  });
}

List<AnimalData> animalsData = [
  AnimalData(
    name: 'Axolotl',
    imagePath: 'assets/images/animals/animal/axolotl.png',
    sleepImagePath: 'assets/images/animals/sleep/axolotl_sleep.png',
    washImagePath: 'assets/images/animals/sleep/axolotl_sleep.png',
    eatImagePath: 'assets/images/animals/eat/axolotl_eat.png',
    eduImagePath: 'assets/images/animals/sleep/axolotl_sleep.png',
    playImagePath: 'assets/images/animals/sleep/axolotl_sleep.png',
    backgroundImagePath: 'assets/images/animals/background/axolotl_bg.png',
  ),
  // Add data for other animals here
];
