import 'package:get/get.dart';

class SplashScreenController extends GetxController {
   var isLogging  = true.obs;
   @override
  void onInit() {
    Future.delayed((const Duration(seconds: 2)),(){
      isLogging.value = false;
    });
    super.onInit();
  }
}