import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_multi_env/data/data_source/firebase/firebase_auth_service.dart';
import 'package:flutter_multi_env/data/data_source/firebase/google_sign_in_service.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GoogleSignInService _authService = GoogleSignInService();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Env Example'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Base URL: ${dotenv.env['BASE_URL']}',
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: Text(
                _firebaseAuthService.isSignedIn()
                    ? 'Sign Out'
                    : 'Sign in with Google',
              ),
              onPressed: () async {
                if (_firebaseAuthService.isSignedIn()) {
                  await _authService.signOut();
                  // Handle sign-out
                  debugPrint('Signed out');
                  return;
                } else {
                  final userCredential = await _authService.signInWithGoogle();
                  if (userCredential != null) {
                    // Navigate to the next screen or show a success message
                    debugPrint(
                        'Signed in as ${userCredential.user?.displayName}');
                  } else {
                    // Handle sign-in failure
                    debugPrint('Sign-in failed');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: 'Google Sign-In Demo',
//     home: Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Center(
//         child: ElevatedButton.icon(
//           icon: Icon(Icons.login),
//           label: Text('Sign in with Google'),
//           onPressed: () async {
//             final userCredential = await _authService.signInWithGoogle();
//             if (userCredential != null) {
//               // Navigate to the next screen or show a success message
//               print('Signed in as ${userCredential.user?.displayName}');
//             } else {
//               // Handle sign-in failure
//               print('Sign-in failed');
//             }
//           },
//         ),
//       ),
//     ),
//   );
// }
