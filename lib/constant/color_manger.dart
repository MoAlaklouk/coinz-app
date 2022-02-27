import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#000000");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color morelightGrey = HexColor.fromHex("#D3D3D3");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color facebookBlue = HexColor.fromHex("#4267B2");
  static Color whatsUpGreen = HexColor.fromHex("#25D366");
  static Color emailRead = HexColor.fromHex("#EA4335");
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
