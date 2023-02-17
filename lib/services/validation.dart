import 'package:get/get.dart';

class FieldValidation {
  
  static String? passwordValidator(value){
    if(value!.isEmpty){
      return 'Password is required';
    }else if(value.length <= 3){
      return "Password must consistof 4 characters";
    }
    return null;
  }



  static String? confirmPasswordValidator(value, password, confrimPassword ){
    if(value!.isEmpty){
      return 'Confrim password is required';
    }else if(password != confrimPassword){
      return "Your password not match";
    }
    return null;
  }


  static String? emailValidator(value){
    if(value!.isEmpty){
      return 'Email is required';
    }else if(!GetUtils.isEmail(value)){
      return 'Email is not valid';
    }
    return null;
  }

  static  nameValidator ({required dynamic  value, required String data}){
    if(value!.isEmpty){
      return "$data  is required";
    }else if(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)){
      return "Please enter valid name";
    }else{
      return null;
    }
  }
} 