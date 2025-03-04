import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Styles {
  static const title = TextStyle(
      fontFamily: 'CircularSpotify',
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: 0.0);

  static const TextStyle tileTitle = TextStyle(
      fontFamily: 'CircularSpotify',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white);

  static const TextStyle miniPlayerTile = TextStyle(
      fontFamily: 'CircularSpotify',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white);

  static const TextStyle miniTileTitle = TextStyle(
      fontFamily: 'CircularSpotify',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white);

  static TextStyle bottomNavText = const TextStyle(
      fontFamily: 'CircularSpotify',
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const TextStyle timeTextStyle = TextStyle(
      fontFamily: 'CircularSpotify',
      fontWeight: FontWeight.w700,
      color: Colors.black54,
      fontSize: 20);

  static const TextStyle textSubTitle = TextStyle(
      fontFamily: 'CircularSpotify',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black);

  static const mainColor = Color(0xFF0668D7);

  static MaterialColor materialColor = const MaterialColor(
    _appThemeColorPrimaryValue,
    <int, Color>{
      50: Color(0xFF0668D7),
      100: Color(0xFF0668D7),
      200: Color(0xFF0668D7),
      300: Color(0xFF0668D7),
      400: Color(0xFF0668D7),
      500: Color(_appThemeColorPrimaryValue),
      600: Color(0xFF0668D7),
      700: Color(0xFF0668D7),
      800: Color(0xFF0668D7),
      900: Color(0xFF0668D7),
    },
  );

  static const int _appThemeColorPrimaryValue = 0xFF0668D7;

  static Widget spinkit(color) => SpinKitDoubleBounce(
        color: color,
        size: 30.0,
      );

  static Widget divider(color) => Divider(
        thickness: 1,
        color: color.withOpacity(0.2),
        height: 1,
      );
}
