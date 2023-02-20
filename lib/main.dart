import 'package:chat_app/app.dart';
import 'package:chat_app/services/push_notification.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await LocalNotificationService.notificationsPlugin.initialize(LocalNotificationService.initialization);
  runApp( MyApp());
}
