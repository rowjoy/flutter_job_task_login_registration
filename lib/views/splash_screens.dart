// ignore_for_file: avoid_unnecessary_containers

import 'package:chat_app/data/strings.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:flutter/material.dart';

import '../widgets/custombutton.dart';
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
      // Future.delayed( const Duration(milliseconds: 100),(){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginView()));
      // });
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset("assets/images/login-screen.png"),
                ),
                Text(Strings.noteInfo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                isTrue ?  const CircularProgressIndicator(
                    color: Colors.white,
                  ): Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        width: MediaQuery.of(context).size.width / 2.4,
                        label: "Sigin",
                        onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginView()));
                        },
                      ),
                      CustomButton(
                        width: MediaQuery.of(context).size.width / 2.4,
                        label: "Sigin Up",
                        onPressed: (){

                        },
                        backgroundColor: Colors.red,
                        labelColor: Colors.white,
                      ),
                    ],
                  ),
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}

