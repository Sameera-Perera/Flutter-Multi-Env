import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

void setupFirebaseMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    debugPrint('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    debugPrint('User granted provisional permission');
  } else {
    debugPrint('User declined or has not accepted permission');
  }

  // Get the token
  String? token = await messaging.getToken();
  debugPrint("FCM Token: $token");

  // Handle foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Received a message while in the foreground!');
    debugPrint('Message data: ${message.data}');
    if (message.notification != null) {
      debugPrint(
          'Message also contained a notification: ${message.notification}');
    }
  });

  // Handle background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

// Define the background message handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
}

// This function is called when the app is opened from a terminated state
void setupInteractedMessage(GlobalKey<NavigatorState> navigatorKey) async {
  // Handle the message when the app is opened from a terminated state
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  debugPrint('Initial message: $initialMessage');
  if (initialMessage != null) {
    _handleMessage(initialMessage, navigatorKey);
  }

  // Handle the message when the app is in background and opened via notification
  FirebaseMessaging.onMessageOpenedApp.listen((_) {
    _handleMessage(initialMessage, navigatorKey);
  });

  // Handle the message when the app is in foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Foreground message: $message');
    _handleMessage(message, navigatorKey);
  });
}

// Handle messages when the app is opened from a terminated state
void _handleMessage(
    RemoteMessage? message, GlobalKey<NavigatorState> navigatorKey) {
  debugPrint('Message data: ${message?.data}');
  navigatorKey.currentState?.pushNamed('/notification');
}
