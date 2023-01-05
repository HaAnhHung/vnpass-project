import 'package:flutter/material.dart';

class AppTheme {
  static Color greenApp = HexColor.fromHex("#2c796f");
  static Color greenApp1 = HexColor.fromHex("#52c083");
  static Color greenApp2 = HexColor.fromHex("#378c75");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color black = HexColor.fromHex("#000000");
  static Color greyBackground = HexColor.fromHex("#F2F2F2");
  static Color black1 = HexColor.fromHex("#282828");
  static Color grey1 = HexColor.fromHex("#FCFCFC");
  static Color grey2 = HexColor.fromHex("#8D8D8D");
  static Color grey3 = HexColor.fromHex("#C0C0C0");

}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}