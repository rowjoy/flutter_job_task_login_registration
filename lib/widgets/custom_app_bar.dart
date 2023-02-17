
// ignore_for_file: use_key_in_widget_constructors


import 'package:chat_app/services/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/colors.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
 
  final double height;
   CustomAppBar({
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);
      final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: box.read(Keys.sessionId) != null ? const SizedBox() : InkWell(
          child: const Icon(Icons.arrow_back_ios,color: AppColors.whiteColor,),
          onTap: (){
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: AppColors.sayGreyColor,
      );
  }
}