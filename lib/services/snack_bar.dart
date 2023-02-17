import 'package:chat_app/services/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar{
  static showSucessSnackBar({String? message, String? title, SnackPosition? snackPosition,Color? backgroundColor}){
    Get.snackbar(
      title!, message!,
      duration: const Duration(seconds: 5),
      titleText: Text(title,style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteColor),),
      messageText:  Text(message,style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.whiteColor.withOpacity(0.9)),),
      backgroundColor: AppColors.greenColor,
      borderRadius: 4.0,
      snackPosition: snackPosition ?? SnackPosition.TOP
    );
 }
 static showErrorSnackBar({String? message, String? title, SnackPosition? snackPosition,Color? backgroundColor}){
    Get.snackbar(
      title!, message!,
      duration: const Duration(seconds: 5),
      titleText: Text(title,style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteColor),),
      messageText:  Text(message,style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.whiteColor.withOpacity(0.9)),),
      backgroundColor: AppColors.redColor,
      borderRadius: 4.0,
      snackPosition: snackPosition ?? SnackPosition.TOP
    );
 }
}