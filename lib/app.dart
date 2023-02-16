import 'package:chat_app/views/splash_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark() ,
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: SplashScreens(),
    );
  }
}