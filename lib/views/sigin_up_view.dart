// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:chat_app/controller/sigin_up_controller.dart';
import 'package:chat_app/models/sigin_up_model.dart';
import 'package:chat_app/services/colors.dart';
import 'package:chat_app/services/text_edtor_value.dart';
import 'package:chat_app/services/validation.dart';
import 'package:chat_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/strings.dart';
import '../widgets/customTextField.dart';
import '../widgets/custombutton.dart';
class SiginUpScreen extends StatelessWidget {
  SiginUpScreen({super.key});
  final SiginUpController _siginUpController = Get.put(SiginUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        reverse: false,
        child: SafeArea(
          child: Form(
            key: TextEditControllers.siginUpFormKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children:  [
                          SizedBox(height: 100,),
                          Text(Strings.siginUp,
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15,),
                          CoustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            label: Strings.fristName,
                            prefixIcon: Icon(Icons.person, color: AppColors.greyColor,),
                            controller: TextEditControllers.fristNameController,
                            validator: (value) => FieldValidation.nameValidator(value: value, data: Strings.fristName),
                          ),
                          SizedBox(height: 15,),
                          CoustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            label: Strings.lastName,
                            prefixIcon: Icon(Icons.person, color: AppColors.greyColor,),
                            controller: TextEditControllers.lastNameController,
                            validator: (value) => FieldValidation.nameValidator(value: value, data:  Strings.lastName) ,
                          ),
                          SizedBox(height: 15,),
                          CoustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            label: Strings.enterEmail,
                            prefixIcon: Icon(Icons.email, color: AppColors.greyColor,),
                            controller: TextEditControllers.emailController,
                            validator: (value)=> FieldValidation.emailValidator(value),
                          ),
                          SizedBox(height: 15,),
                         Obx(() =>(
                            CoustomTextFormField(
                              label: Strings.enterPassword,
                              obscureText: _siginUpController.newObscureText.value,
                              prefixIcon: Icon(Icons.lock,color: AppColors.greyColor,),
                              suffixIcon: InkWell(
                                onTap: (){
                                  _siginUpController.newObscureText.value = ! _siginUpController.newObscureText.value;
                                },
                                child: Icon(  _siginUpController.newObscureText.value ? Icons.visibility_off : Icons.visibility,color: AppColors.greyColor,),
                              ),
                              controller: TextEditControllers.passwordController,
                              validator: (value) => FieldValidation.passwordValidator(value),
                            )
                          )),
                          SizedBox(height: 15,),
                          Obx(()=>( CoustomTextFormField(
                              label: Strings.confirmPassword,
                              obscureText: _siginUpController.matchObscureText.value,
                              prefixIcon: Icon(Icons.lock,color: AppColors.greyColor,),
                              suffixIcon: InkWell(
                                onTap: (){
                                  _siginUpController.matchObscureText.value = !_siginUpController.matchObscureText.value;
                                },
                                child: Icon(  _siginUpController.matchObscureText.value ? Icons.visibility_off : Icons.visibility,color: AppColors.greyColor,),
                              ),
                              controller: TextEditControllers.confirmController,
                              validator: (value)=> FieldValidation.confirmPasswordValidator(value, TextEditControllers.passwordController.text , value),
                            )
                          )),
                          SizedBox(height: 16,),
                           Obx(()=> _siginUpController.lodding.value  ?  Center(child: CircularProgressIndicator())  : CustomButton(
                              width: MediaQuery.of(context).size.width,
                              label: Strings.siginUp, 
                              onPressed:(){
                               var siginUpData = SiginUpModel(
                                  username: TextEditControllers.emailController.text,
                                  password: TextEditControllers.passwordController.text,
                                  email: TextEditControllers.emailController.text,
                                  profile: Profile(
                                     firstName: TextEditControllers.fristNameController.text,
                                    lastName: TextEditControllers.lastNameController.text,
                                  ),
                               );
                              if(TextEditControllers.siginUpFormKey.currentState!.validate()){
                                TextEditControllers.siginUpFormKey.currentState!.save();
                                _siginUpController.siginUpPost(siginUpData);
                              }
                              },
                              labelColor: AppColors.whiteColor,
                              backgroundColor: AppColors.redColor,
                            ),
                          ),
                        SizedBox(height: 32,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(Strings.copyright,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}