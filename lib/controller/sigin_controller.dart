import 'package:chat_app/controller/user_profile_controller.dart';
import 'package:chat_app/core/utils/log.dart';
import 'package:chat_app/models/sigin_model.dart';
import 'package:chat_app/services/keys.dart';
import 'package:chat_app/services/snack_bar.dart';
import 'package:chat_app/views/dashboard_view.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/strings.dart';

class SiginController extends GetxController{
  UserProfileController userProfileController =  Get.put(UserProfileController());
  final dio = Dio();
  final box = GetStorage();
  var lodding = false.obs;
  var obscureText = true.obs;
  Future siginPost ( SiginModel siginModel)async {
    lodding.value = true;
     try{
      final response = await dio.post(Keys.baseUrl + Keys.siginUrl,
        data: siginModel.toJson(),
        options: Options(
          headers: {
             "Content-Type" : "application/json",
          }
        ),
      );
      if(response.statusCode == 200){
          box.write(Keys.sessionId, response.data["session_id"]);
          box.write(Keys.consumerUuid, response.data["consumer_uuid"]);
          userProfileController.getUserInfo(quarry: response.data["consumer_uuid"]);
          lodding.value = false;
          Get.offAll(()=>  DashboardScreen());
          //Get.to(()=> const DashboardScreen());
      }
     } on DioError catch(e){
      CustomSnackBar.showErrorSnackBar(
        snackPosition: SnackPosition.TOP,
        message:  e.response!.data["error_description"],
        title: Strings.badTitle,
      );
      lodding.value = false;
      Logger(key: "Responce err", value: e.response!.data);
     }
  }
}