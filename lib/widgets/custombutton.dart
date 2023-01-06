import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final void Function()?  onPressed;
  final Color? backgroundColor;
  final double? width;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.labelColor = Colors.black,
    this.width ,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          // ignore: prefer_const_constructors
        ) ,
        onPressed: onPressed,
        // ignore: prefer_const_constructors, unnecessary_string_interpolations
        child: Text("$label", style: TextStyle(
          color: labelColor,
          fontSize: 18,
          letterSpacing: 1,
        ),)
      ),
    );
  }
}