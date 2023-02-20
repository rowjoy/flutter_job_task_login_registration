// ignore_for_file: unnecessary_string_interpolations

import 'package:chat_app/core/utils/log.dart';
import 'package:chat_app/models/user_profile_model.dart';
import 'package:chat_app/services/keys.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController{
  var userName = "".obs; 
  final dio = Dio();
  Future getUserInfo ({required String? quarry})async{
    try {
      // ignore: prefer_interpolation_to_compose_strings, unused_local_variable
      final response = await dio.get(Keys.baseUrl + Keys.userProfileUrl + "$quarry");
      UserProfileModel userProfileModel = UserProfileModel.fromJson(response.data);
      Logger(key: "responce", value: userProfileModel.firstName);
      userName.value = "${userProfileModel.firstName} ${userProfileModel.lastName}"  ;
    } on DioError catch(e){
      Logger(key: "Responce", value: e.response!.data);
    }
  }
}