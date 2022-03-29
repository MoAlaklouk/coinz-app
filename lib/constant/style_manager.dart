import 'fonts_manager.dart';
import 'package:flutter/material.dart';


TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWight, Color color) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWight);
}
// regular style

TextStyle getRegularStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
  fontFamily = FontConstants.fontFamily,
}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.regular, color);
}

TextStyle getLightStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
  fontFamily = FontConstants.fontFamily,
}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.light, color);
}
// bold text style

TextStyle getBoldStyle(
    {double fontSize = FontSizeManager.s12,
    required Color color,
    fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(
    fontSize,
    fontFamily,
    FontWeightManager.bold,
    color,
  );
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSizeManager.s12,
    required Color color,
    fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.semiBold, color);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSizeManager.s12,
    fontFamily = FontConstants.fontFamily,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.medium, color);
}
