// ignore_for_file: prefer_const_constructors

import 'package:chat_app/services/colors.dart';
import 'package:flutter/material.dart';
class CoustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool  obscureText ;
  final String? Function(String?)? validator;
  const CoustomTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ,
      keyboardType: keyboardType,
      style: TextStyle(
        color: AppColors.backColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      validator: validator,
      autovalidateMode:AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // ignore: unnecessary_string_interpolations
        hintText: "$label",
        hintStyle: TextStyle(
          color: AppColors.greyColor,
        ),
        border: OutlineInputBorder(),
        fillColor: AppColors.whiteColor,
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        
      ),
    );
  }
}