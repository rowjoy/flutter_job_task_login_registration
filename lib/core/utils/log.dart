import 'package:flutter/material.dart';
class Logger{
  final String? key;
  final dynamic value;
  Logger({@required this.key, @required this.value}){
    // ignore: avoid_print
    print("🌶️ $key : $value");
  }
}