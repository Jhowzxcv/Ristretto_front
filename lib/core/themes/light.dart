import 'package:flutter/material.dart';
import 'package:ristretto/core/themes/colors.dart';

final ThemeData lightTheme=ThemeData(
  colorScheme:ColorScheme.fromSeed(
    seedColor:AppColors.primaryColor,
  ),
  textTheme:const TextTheme(
    displayLarge:TextStyle(
      fontWeight:FontWeight.bold,
      fontSize:40,
    ),
    headlineLarge:TextStyle(
      fontWeight:FontWeight.bold,
      fontSize:26,
    ),
    titleMedium:TextStyle(
      fontWeight:FontWeight.bold,
      fontSize:18,
    ),
    bodyMedium:TextStyle(
      fontSize:16,
    ),
    bodySmall:TextStyle(
      fontSize:12,
      color:AppColors.secondaryColor,
    ),
  ),
);
