// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:chat_app/controller/sigin_controller.dart';
import 'package:chat_app/models/sigin_model.dart';
import 'package:chat_app/services/colors.dart';
import 'package:chat_app/services/keys.dart';
import 'package:chat_app/services/strings.dart';
import 'package:chat_app/services/text_edtor_value.dart';
import 'package:chat_app/services/validation.dart';
import 'package:chat_app/widgets/custom_app_bar.dart';
import 'package:chat_app/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/customTextField.dart';
class SiginScreen extends StatelessWidget {
  SiginScreen({super.key});
  final SiginController _siginController = Get.put(SiginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form (
            key: TextEditControllers.siginformKey,
            child: Column(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.asset(Strings.siginImagePath),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children:  [
                        Text( Strings.sigin,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
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
                       Obx(()=>(CoustomTextFormField(
                            label: Strings.enterPassword,
                            obscureText: _siginController.obscureText.value,
                            prefixIcon: Icon(Icons.lock,color: AppColors.greyColor,),
                            suffixIcon: InkWell(
                              onTap: (){
                                _siginController.obscureText.value = ! _siginController.obscureText.value;
                              },
                              child: Icon(  _siginController.obscureText.value  ? Icons.visibility_off : Icons.visibility,color:AppColors.greyColor,),
                            ),
                            controller: TextEditControllers.passwordController,
                            validator: (value) => FieldValidation.passwordValidator(value) ,
                          )
                        )),
                        SizedBox(height: 16,),
                        Obx(()=>(_siginController.lodding.value ? Center(child: CircularProgressIndicator(),)  :  CustomButton(
                            width: MediaQuery.of(context).size.width,
                            label: Strings.sigin, 
                            onPressed:(){
                              //sigin model
                              var siginModel = SiginModel(
                                username: TextEditControllers.emailController.text,
                                password: TextEditControllers.passwordController.text
                              );
                              if(TextEditControllers.siginformKey.currentState!.validate()){
                                TextEditControllers.siginformKey.currentState!.save();
                                //sigin data pass
                                 _siginController.siginPost(siginModel);
                              }
                               
                            }
                          )),
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
              ],
            ),
          ),
        )  
      ),
    );
  }
}

