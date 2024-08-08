// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationConfig {
//   final messaging = FirebaseMessaging.instance;
//   final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   final _channel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     importance: Importance.high,
//   );

//   Future<void> configure() async {
//     await _initializeNotifications();
//     await _reqPermissionIos();

//     await messaging.getToken().then((token) {
//       debugPrint('Device Token:\n$token');
//     });

//     await messaging.setAutoInitEnabled(true);

//     await messaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       showNotification(message);
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen(
//       (RemoteMessage message) {
//         debugPrint(message.data['route']);
//         if (message.data['route'] == 'Notifications') {}
//         debugPrint('Notifikasi ditekan!');
//       },
//     );
//   }

//   Future<String> getTokenNotification() async {
//     return await messaging.getToken() ?? '';
//   }

//   Future<void> _initializeNotifications() async {
//     // Create an instance of the Android initialization settings
//     var initializationSettingsAndroid = const AndroidInitializationSettings(
//       '@mipmap/launcher_icon',
//     );

//     // Create an instance of the iOS initialization settings
//     var initializationSettingsIOS = const DarwinInitializationSettings();

//     // Initialize settings for both Android and iOS
//     var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     // Initialize the plugin
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> _reqPermissionIos() async {
//     await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: true,
//       sound: true,
//     );
//   }

//   Future<void> showNotification(RemoteMessage message) async {
//     RemoteNotification notification = message.notification!;
//     _flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           _channel.id,
//           _channel.name,
//           icon: 'icon_app',
//         ),
//       ),
//     );
//   }
// }
