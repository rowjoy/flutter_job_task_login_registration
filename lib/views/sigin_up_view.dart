// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:chat_app/controller/sigin_up_controller.dart';
import 'package:chat_app/models/sigin_up_model.dart';
import 'package:chat_app/services/text_edtor_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/strings.dart';
import '../widgets/customTextField.dart';
import '../widgets/custombutton.dart';
class SiginUpScreen extends StatefulWidget {
  const SiginUpScreen({super.key});

  @override
  State<SiginUpScreen> createState() => _SiginUpScreenState();
}
class _SiginUpScreenState extends State<SiginUpScreen> {
  bool  obscureText = false;
  final SiginUpController _siginUpController = Get.put(SiginUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children:  [
                          SizedBox(height: 100,),
                          Text("Sigin Up",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15,),
                          CoustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            label: "Frist name",
                            prefixIcon: Icon(Icons.person, color: Colors.grey,),
                            controller: TextEditControllers.fristNameController,
                          ),
                          SizedBox(height: 15,),
                          CoustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            label: "Last name",
                            prefixIcon: Icon(Icons.person, color: Colors.grey,),
                            controller: TextEditControllers.lastNameController,
                          ),
                          SizedBox(height: 15,),
                          CoustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            label: "Enter email",
                            prefixIcon: Icon(Icons.email, color: Colors.grey,),
                            controller: TextEditControllers.emailController,
                          ),
                          SizedBox(height: 15,),
                          CoustomTextFormField(
                            label: "Enter Password",
                            obscureText: obscureText,
                            prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon( obscureText ? Icons.visibility_off : Icons.visibility,color: Colors.grey,),
                            ),
                            controller: TextEditControllers.passwordController,
                          ),
                          SizedBox(height: 15,),
                          CoustomTextFormField(
                            label: "confirm password",
                            obscureText: obscureText,
                            prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon( obscureText ? Icons.visibility_off : Icons.visibility,color: Colors.grey,),
                            ),
                            controller: TextEditControllers.confirmController,
                          ),
                          SizedBox(height: 16,),
                          CustomButton(
                            width: MediaQuery.of(context).size.width,
                            label: "Sigin Up", 
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

                            _siginUpController.siginUpPost(siginUpData);
      
                            },
                            labelColor: Colors.white,
                            backgroundColor: Colors.red,
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