import 'package:flutter/material.dart';

import 'fonts_manager.dart';

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
  double fontSize = 12,
  required Color color,
  fontFamily = FontConstants.fontFamily,
}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.regular, color);
}

TextStyle getLightStyle({
  double fontSize = 12,
  required Color color,
  fontFamily = FontConstants.fontFamily,
}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.light, color);
}
// bold text style

TextStyle getBoldStyle(
    {double fontSize = 12,
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
    {double fontSize = 12,
    required Color color,
    fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.semiBold, color);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = 12,
    fontFamily = FontConstants.fontFamily,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.medium, color);
}
