# Flutter Multi-Environment Setup with `.env` Files

This guide explains how to configure multiple environments (e.g., dev, staging, prod) in a Flutter app using `.env` files and the [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) package.

---

## ✅ Step-by-Step Guide

### 1. Install `flutter_dotenv`

In your `pubspec.yaml`:

```yaml
dependencies:
  flutter_dotenv: ^5.1.0
```

Then install packages:

```bash
flutter pub get
```

---

### 2. Create `.env` Files for Each Environment

Create separate files at the root of your project:

- `.env.dev`
  ```env
  BASE_URL=https://api.dev.example.com
  ```

- `.env.staging`
  ```env
  BASE_URL=https://api.staging.example.com
  ```

- `.env.prod`
  ```env
  BASE_URL=https://api.example.com
  ```

---

### 3. Modify `main.dart` to Load the Environment File

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'home_screen.dart';

Future<void> main() async {
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  await dotenv.load(fileName: '.env.$env');

  runApp(MyApp(baseUrl: dotenv.env['BASE_URL'] ?? ''));
}
```

---

### 4. Update `MyApp` to Accept the Base URL

```dart
// lib/home_screen.dart
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final String baseUrl;

  const MyApp({required this.baseUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Env Example',
      home: Scaffold(
        body: Center(child: Text('Base URL: $baseUrl')),
      ),
    );
  }
}
```

---

### 5. Running and Building with Different Environments

Use `--dart-define=ENV=your_env` to control which `.env` file is loaded.

```bash
# Run in development mode
flutter run --dart-define=ENV=dev

# Run in staging mode
flutter run --dart-define=ENV=staging

# Run in production mode
flutter run --dart-define=ENV=prod
```

```bash
# Build APK
flutter build apk --dart-define=ENV=prod

# Build appbundle
flutter build appbundle --dart-define=ENV=prod
```

---

### 6. (Optional) Add `.env` Files to `.gitignore`

If you store sensitive keys:

```gitignore
.env*
!*.example
```

---

## ✅ Benefits

- Clean separation of config values for different environments.
- No need to create multiple Dart entry files.
- Easy to build and test for different backends.

---

## 📦 Example Directory Structure

```
my_flutter_app/
│
├── lib/
│   ├── main.dart
│   ├── my_app.dart
│
├── .env.dev
├── .env.staging
├── .env.prod
├── pubspec.yaml
└── ...
```

---

# FlutterGen - Asset Management
FlutterGen is a code generator for Flutter assets, fonts, colors, and more. It helps you manage your assets in a type-safe way.

## Installation
Add the following to your `pubspec.yaml`:

```yaml
dev_dependencies:
  build_runner: ^2.4.9
  flutter_gen_runner: ^5.4.0
```

## Usage
Run the following command to generate the assets:

```bash
  dart run build_runner build
```

## 🔗 Resources

- [flutter_dotenv on pub.dev](https://pub.dev/packages/flutter_dotenv)
- [Flutter build documentation](https://docs.flutter.dev/deployment)