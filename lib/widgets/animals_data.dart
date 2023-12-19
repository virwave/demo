class AnimalData {
  final String name;
  final String imagePath;

  AnimalData({
    required this.name,
    required this.imagePath,
  });
}

List<AnimalData> animalsData = [
  AnimalData(
    name: 'Axolotl',
    imagePath: 'assets/images/animals/animal/axolotl.png',
  ),
  // Add data for other animals
];
