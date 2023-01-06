import 'package:chat_app/views/splash_screens.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark() ,
      debugShowCheckedModeBanner: false,
      home: SplashScreens() ,
    );
  }
}