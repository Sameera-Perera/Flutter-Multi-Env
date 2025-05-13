import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_multi_env/presentation/screen/nortification/notification_screen.dart';
import 'data/data_source/firebase/firebase_messaging_service.dart';
import 'firebase_options.dart';
import 'presentation/screen/home/home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // Ensure that plugin services are initialized so that we can use dotenv
  // and other plugins that require plugin services
  WidgetsFlutterBinding.ensureInitialized();

  // This is the entry point of the app
  // It initializes the app and loads the environment variables
  // Make sure to run the app with the correct environment
  // Example: flutter run --dart-define=ENV=dev
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  await dotenv.load(fileName: '.env.$env');

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup Firebase Messaging
  setupFirebaseMessaging();

  // Set preferred orientations
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setupInteractedMessage(navigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Env Example',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/notification': (context) => const NotificationScreen(),
      },
    );
  }
}
