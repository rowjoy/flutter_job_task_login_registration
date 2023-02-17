// ignore_for_file: avoid_unnecessary_containers

import 'package:chat_app/controller/splash_screen_controller.dart';
import 'package:chat_app/services/colors.dart';
import 'package:chat_app/services/strings.dart';
import 'package:chat_app/views/sigin_up_view.dart';
import 'package:chat_app/views/sigin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custombutton.dart';
class SplashScreens extends StatelessWidget {
   SplashScreens({super.key});
  final SplashScreenController _splashScreenController = Get.put(SplashScreenController());
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
                  child: Image.asset(Strings.siginImagePath),
                ),
                Text(Strings.noteInfo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                  ),
                ),
                Obx(()=>(_splashScreenController.isLogging.value ?  const CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ): Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: MediaQuery.of(context).size.width / 2.4,
                          label: Strings.sigin,
                          onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> SiginScreen()));
                          },
                        ),
                        CustomButton(
                          width: MediaQuery.of(context).size.width / 2.4,
                          label: Strings.siginUp,
                          onPressed: (){
                              Get.to(SiginUpScreen());
                          },
                          backgroundColor: AppColors.redColor,
                          labelColor: AppColors.whiteColor,
                        ),
                      ],
                    ))
                ),
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}

