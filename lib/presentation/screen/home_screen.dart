import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Env Example'),
      ),
      body: Center(
        child: Text(
          'Base URL: ${dotenv.env['BASE_URL']}',
        ),
      ),
    );
  }
}
