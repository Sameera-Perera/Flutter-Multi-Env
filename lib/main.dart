import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'presentation/screen/home_screen.dart';

Future<void> main() async {

  /// This is the entry point of the app
  /// It initializes the app and loads the environment variables
  /// Make sure to run the app with the correct environment
  /// Example: flutter run --dart-define=ENV=dev
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  await dotenv.load(fileName: '.env.$env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Env Example',
      home: HomeScreen(),
    );
  }
}