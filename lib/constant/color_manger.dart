import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#000000");
  static Color darkGrey = HexColor.fromHex("#95989C");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#979797");
  static Color lightGreyBorder = HexColor.fromHex("#F4F4F4");

  static Color morelightGrey = HexColor.fromHex("#D3D3D3");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color facebookBlue = HexColor.fromHex("#2D609B");
  static Color twitterBlue = HexColor.fromHex("#00C3F3");


  static Color whatsUpGreen = HexColor.fromHex("#80CE13");
  static Color green = HexColor.fromHex("#38AD65");
  static Color black = HexColor.fromHex("#000000");

  static Color error = HexColor.fromHex("#e61f34"); // red color
 
}

//Or

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
