import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Env Example',
      home: Scaffold(
        body: Center(child: Text('Base URL: ${dotenv.env['BASE_URL']}')),
      ),
    );
  }
}