# 🔍 Understanding the Notification Handling Flow

In Flutter, handling user interactions with notifications depends on the app's state:

- Foreground: The app is open and visible.
- Background: The app is running but not visible (e.g., minimized).
- Terminated: The app is not running at all.

To handle notifications appropriately in each state, Firebase provides different methods:

- Foreground: FirebaseMessaging.onMessage.listen
- Background: FirebaseMessaging.onMessageOpenedApp.listen
- Terminated: FirebaseMessaging.instance.getInitialMessage()