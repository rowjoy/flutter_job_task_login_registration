// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, must_be_immutable

import 'package:chat_app/controller/user_profile_controller.dart';
import 'package:chat_app/core/utils/log.dart';
import 'package:chat_app/services/colors.dart';
import 'package:chat_app/services/push_notification.dart';
import 'package:chat_app/services/strings.dart';
import 'package:chat_app/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../services/keys.dart';
class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
 final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomButton(
              width: MediaQuery.of(context).size.width,
              label: Strings.clickMe,
              onPressed: () async{
              await LocalNotificationService.notificationsPlugin.show(
                  0, 
                  "Hi😁😁😁",
                  "${box.read(Keys.userName)} thanks ", 
                  LocalNotificationService.notificationDetails,
                );
              },
              backgroundColor: AppColors.redColor,
              labelColor: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}