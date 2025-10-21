import 'package:flutter/material.dart';

class AppColors{
  static const Color primaryColor=Color(0xFF679FFF);
  static const Color secondaryColor=Color(0xFF505050);

  static const Color listColorA=Color(0XFFFF9B87);
  static const Color listColorB=Color(0xFFFFE5C8);
  static const Color listColorC=Color(0xFFADDAD5);
  static const Color listColorD=Color(0xFFCCDEFD);
  static const Color listColorE=Color(0xFFC3B7F9);
  static const Color listColorF=Color(0xFFFFD7DD);
  static const Color listColorG=Color(0xFFD8BFA7);
}

final List<Color> listsColor=[
  AppColors.listColorA,
  AppColors.listColorB,
  AppColors.listColorC,
  AppColors.listColorD,
  AppColors.listColorE,
  AppColors.listColorF,
  AppColors.listColorG,
];

enum ListColor{
  listColorA(AppColors.listColorA),
  listColorB(AppColors.listColorB),
  listColorC(AppColors.listColorC),
  listColorD(AppColors.listColorD),
  listColorE(AppColors.listColorE),
  listColorF(AppColors.listColorF),
  listColorG(AppColors.listColorG);

  final Color color;
  const ListColor(this.color);
}

Color darken(Color originalColor,double darkness_level){
  HSLColor newColor=HSLColor
    .fromColor(originalColor)
    .withLightness(darkness_level);

  return newColor.toColor();
}
