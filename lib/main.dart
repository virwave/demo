import 'package:flutter/material.dart';
import 'authentication/login.dart';
import 'widgets/world_map.dart';
import 'widgets/ocean_wave.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'meditation_page.dart';
import 'games_page.dart';
import 'progress_tracker_page.dart';
import 'guided_journals_page.dart';
import 'parental_controls_page.dart';
import 'educational_content_page.dart';
import 'widgets/animal.dart';
import 'widgets/animal_actions.dart'; // Import your AnimalActions file

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
        '/meditation': (context) => const MeditationPage(),
        '/games': (context) => const GamesPage(),
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
        // Add more routes as needed
      },
    );
  }
}
