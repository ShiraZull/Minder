import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color pink900A2 = fromHex('#a2671b2f');

  static Color blueGray100 = fromHex('#d9d0d0');

  static Color blueGray50 = fromHex('#edf2f4');

  static Color blueGray600 = fromHex('#4b8171');

  static Color blueGray60099 = fromHex('#994b8171');

  static Color blueGray60001 = fromHex('#63687d');

  static Color blueGray60002 = fromHex('#62687d');

  static Color black9003f = fromHex('#3f000000');

  static Color pink800A2 = fromHex('#a2b71540');

  static Color gray100 = fromHex('#f5f5f5');

  static Color black90087 = fromHex('#87000000');

  static Color whiteA70099 = fromHex('#99fffdfd');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA70001 = fromHex('#fffdfd');

  static Color blueGray600E5 = fromHex('#e562687d');

  static Color blueGray600A2 = fromHex('#a24b8171');

  static Color blueGray900Ab = fromHex('#ab2e3d39');

  static Color blueGray900 = fromHex('#0a1747');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}