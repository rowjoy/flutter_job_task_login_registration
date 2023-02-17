import 'package:chat_app/core/utils/log.dart';
import 'package:chat_app/models/sigin_up_model.dart';
import 'package:chat_app/services/keys.dart';
import 'package:chat_app/services/snack_bar.dart';
import 'package:chat_app/services/strings.dart';
import 'package:chat_app/views/sigin_view.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart';
class SiginUpController extends GetxController {
  var dio = Dio();
  var  newObscureText = true.obs;
  var matchObscureText = true.obs;
  var lodding = false.obs;
  Future siginUpPost ( SiginUpModel siginUpmodel )async{
    lodding.value = true;
    try{
    final response =  await dio.post(Keys.baseUrl + Keys.siginUpUrl,
        data: siginUpmodel.toJson(),
        options: Options(
          headers: {
            "Content-Type" : "application/json",
          },
        ),
      );
     if(response.statusCode == 201){
         lodding.value = false;
        CustomSnackBar.showSucessSnackBar(snackPosition: SnackPosition.TOP, message: Strings.sucessTostsms,title: Strings.sucesstostTitle);
        Get.off(()=>SiginScreen());
     }
    } on DioError catch (e){
       lodding.value = false;
      CustomSnackBar.showErrorSnackBar(
        snackPosition: SnackPosition.TOP,
        message:  e.response!.data["error_description"],
        title: Strings.badTitle,
      );
      Get.off(()=> SiginScreen());
    }
   
   
  }

}