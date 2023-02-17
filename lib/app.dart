import 'package:chat_app/services/keys.dart';
import 'package:chat_app/views/sigin_view.dart';
import 'package:chat_app/views/splash_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class MyApp extends StatelessWidget {
 MyApp({super.key});
final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark() ,
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: box.read(Keys.sessionId) != null ? SiginScreen() : SplashScreens(),
    );
  }
}