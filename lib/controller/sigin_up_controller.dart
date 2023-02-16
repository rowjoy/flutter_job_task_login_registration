import 'package:chat_app/core/utils/log.dart';
import 'package:chat_app/models/sigin_up_model.dart';
import 'package:chat_app/services/keys.dart';
import 'package:chat_app/services/strings.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart';
class SiginUpController extends GetxController {
  var dio = Dio();
  
  Future siginUpPost ( SiginUpModel siginUpmodel )async{
    
    try{
    final response =  await dio.post(Keys.baseUrl + Keys.siginUpUrl,
        data: siginUpmodel.toJson(),
        options: Options(
          headers: {
            "Content-Type" : "application/json",
          },
        ),
      );
    } on DioError catch (e){
      Logger(key: "Err", value: e.response!.data);
    }
   
   
  }

}