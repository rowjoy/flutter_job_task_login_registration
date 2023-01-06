// ignore_for_file: avoid_unnecessary_containers

import 'package:chat_app/views/login_view.dart';
import 'package:flutter/material.dart';
class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  bool isTrue = true;
  @override
  void initState() {
    super.initState();
    Future.delayed((const Duration(seconds: 2)),(){
      setState(() {
        isTrue = false;
      });
      Future.delayed( const Duration(milliseconds: 100),(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginView()));
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset("assets/images/login-screen.png"),
                ),
                isTrue ?  const CircularProgressIndicator(
                    color: Colors.white,
                  ): const Text("Welcome",style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}