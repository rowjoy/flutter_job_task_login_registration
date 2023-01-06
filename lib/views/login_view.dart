// ignore_for_file: prefer_const_constructors

import 'package:chat_app/data/strings.dart';
import 'package:chat_app/widgets/custombutton.dart';
import 'package:flutter/material.dart';

import '../widgets/customTextField.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool  obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset("assets/images/login-screen.png"),
                ),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children:  [
                      Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15,),
                      CoustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        label: "Enter email",
                        prefixIcon: Icon(Icons.person, color: Colors.grey,),
                        controller: TextEditingController(),
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
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 16,),
                      CustomButton(
                        width: MediaQuery.of(context).size.width,
                        label: "Login", 
                        onPressed:(){

                        },
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
        )  
      ),
    );
  }
}

