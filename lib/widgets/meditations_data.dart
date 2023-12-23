class Meditation {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final dynamic content;

  Meditation({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.content,
  });
}

class MeditationsData {
  static List<Meditation> meditations = [
    Meditation(
      id: 0,
      title: 'Meditation 0',
      imageUrl: 'assets/images/icons/smile.png',
      description: 'Description for Emotions...',
      content: 'assets/videos/meditation1.mp4',
    ),
    Meditation(
      id: 1,
      title: 'Meditation 1',
      imageUrl: 'assets/images/icons/smile.png',
      description: 'Description for Meditation 1...',
      content: 'assets/videos/meditation1.mp4',
    ),
    Meditation(
      id: 2,
      title: 'Meditation 2',
      imageUrl: 'assets/images/icons/smile.png',
      description: 'Description for Meditation 2...',
      content: 'assets/videos/meditation1.mp4',
    ),
    // Other meditations...
  ];
}
