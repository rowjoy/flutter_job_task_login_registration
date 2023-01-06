// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class CoustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool  obscureText ;
  const CoustomTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ,
      keyboardType: keyboardType,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // ignore: unnecessary_string_interpolations
        hintText: "$label",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        
      ),
    );
  }
}