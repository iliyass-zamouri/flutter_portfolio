import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/color_palette.dart';
import 'package:flutter_portfolio/styles/styles.dart';

class StateProvider extends ChangeNotifier {
  ColorPalette colorPalette = const ColorPalette(
      Styles.mainColor, Color(0xFF353535), Colors.white, Color(0xFF181818));
  bool isDark = true;

  toggleColor() {
    isDark = !isDark;
    if (isDark) {
      colorPalette = const ColorPalette(
          Styles.mainColor, Color(0xFF353535), Colors.white, Color(0xFF181818));
    } else {
      colorPalette = const ColorPalette(
          Styles.mainColor, Colors.white, Color(0xFF181818), Color(0xFFF3F2EF));
    }
    notifyListeners();
  }
}
