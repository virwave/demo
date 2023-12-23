import 'package:flutter/material.dart';
import 'authentication/login.dart';
import 'widgets/world_map.dart';
import 'widgets/ocean_wave.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'widgets/meditations.dart'; // Updated import for MeditationsPage
import 'games_page.dart';
import 'progress_tracker_page.dart';
import 'guided_journals_page.dart';
import 'parental_controls_page.dart';
import 'educational_content_page.dart';
import 'widgets/animal.dart';
import 'widgets/sleep.dart';
import 'widgets/eat.dart';
import 'widgets/meditation1.dart'; // Updated import for Meditation1Screen

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const WorldMap(),
        '/ocean_waves': (context) => const OceanWave(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/games': (context) => const GamesPage(),
        '/meditations': (context) => const MeditationsPage(),
        '/progress_tracker': (context) => const ProgressTrackerPage(),
        '/guided_journals': (context) => const GuidedJournalsPage(),
        '/parental_controls': (context) => const ParentalControlsPage(),
        '/educational_content': (context) => const EducationalContentPage(),
        '/animal': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          final animalName = args['animalName'] as String;
          return AnimalPage(animalName: animalName);
        },
        '/sleep': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          final animalName = args['animalName'] as String;
          return SleepPage(animalName: animalName);
        },
        '/eat': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          final animalName = args['animalName'] as String;
          return EatPage(animalName: animalName);
        },
        // Update the route for Meditation 1 to match the correct class name
        '/meditation1': (context) => const Meditation1Page(),
        // Add more routes as needed for other meditations
        // '/meditation_2': (context) => const Meditation2Screen(),
      },
    );
  }
}
