import 'package:flutter/material.dart';

class Gambiarra{
  final String title;
  final Color color;
  bool isComplete;

  Gambiarra({
    required this.title,
    required this.color,
    this.isComplete=false,
  });

  void toggleState(){
    isComplete=!isComplete;
  }
}
