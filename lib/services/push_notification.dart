import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class LocalNotificationService {
 
 static FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

// ignore: prefer_final_fields
 static InitializationSettings initialization =  const InitializationSettings(
  android: AndroidInitializationSettings("@mipmap/ic_launcher"),
  iOS: DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestCriticalPermission: true,
  ),
);

 static NotificationDetails notificationDetails = const NotificationDetails(
  iOS: DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  ),
  android: AndroidNotificationDetails(
    "Test-app", "App-test",
    priority: Priority.max,
    importance: Importance.max,
  ),
);



}