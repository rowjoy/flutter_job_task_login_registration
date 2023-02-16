import 'package:chat_app/core/utils/log.dart';
import 'package:chat_app/models/sigin_model.dart';
import 'package:chat_app/services/keys.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SiginController extends GetxController{
  final dio = Dio();
  Future siginPost ( SiginModel siginModel)async {
     try{
      final response = await dio.post(Keys.baseUrl + Keys.siginUrl,
        data: siginModel.toJson(),
        options: Options(
          headers: {
             "Content-Type" : "application/json",
          }
        ),
      );
      Logger(key: "Data", value: response.statusCode);
     } on DioError catch(e){
      Logger(key: "Responce err", value: e.response!.data);
     }
  }
}