// ignore_for_file: unnecessary_string_interpolations

import 'package:chat_app/services/keys.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController{
  final dio = Dio();
  Future getUserInfo (String quarry)async{
    try {
      // ignore: prefer_interpolation_to_compose_strings, unused_local_variable
      final response = await dio.get(Keys.baseUrl + Keys.userProfileUrl + "$quarry");
    } on DioError catch(s){}
  }
}