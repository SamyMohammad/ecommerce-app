// import 'package:flutter/material.dart';
//
// abstract class ColorManager {
//   static Color primary = const Color(0xFF004182);
//   static Color appBarTitleColor = const Color(0xFF06004F);
//   static Color primaryDark = const Color(0xFF06004F);
//
//
//
//   static Color darkGrey = const Color(0xff525252);
//   static Color grey = const Color(0xff737477);
//   static Color lightGrey = const Color(0xff9E9E9E);
//   static Color black = const Color(0xff000000);
//   static Color containerGray = const Color(0xffDBE4ED);
//   static Color transparent =  Colors.transparent;
//
//   static const Color starRateColor = Color(0XFFFDD835);
//   static const Color textColor = Color(0xff06004F);
//   static Color darkBlue = const Color(0xff06004F);
//   static Color yellow = const Color(0xFFFDD835);
//
//   // new colors
//   static Color darkPrimary = const Color(0xffd17d11);
//   static Color lightPrimary = const Color(0xCCd17d11); // color with 80% opacity
//   static Color grey1 = const Color(0xff707070);
//   static Color grey2 = const Color(0xff797979);
//   static Color white = const Color(0xffFFFFFF);
//   static Color error = const Color(0xffe61f34); // red color
//
//
//
// }
import 'package:flutter/material.dart';

abstract class ColorManager {
  // Main Theme Colors (Teal & Coral Harmony)
  static Color primary = const Color(0xFF00796B); // Teal
  static Color appBarTitleColor = const Color(0xFF004D40); // Darker Teal
  static Color primaryDark = const Color(0xFF004D40); // Matches appBarTitleColor

  // Grays and Support Colors
  static Color darkGrey = const Color(0xFF424242); // Darker neutral grey
  static Color grey = const Color(0xFF757575);     // Base neutral grey
  static Color lightGrey = const Color(0xFFBDBDBD); // Light grey for backgrounds
  static Color black = const Color(0xFF000000);
  static Color containerGray = const Color(0xFFE0F2F1); // Light Teal-Grey
  static Color mycolor = const Color(0xFF99D9D5); // Light Teal-Grey
  static Color transparent = Colors.transparent;

  // Highlight/Accent Colors
  static const Color starRateColor = Color(0xFFFFB300); // Amber for ratings
  static const Color textColor = Color(0xFF004D40); // Dark teal for readability
  static Color darkBlue = const Color(0xFF00695C); // Slightly darker teal
  static Color yellow = const Color(0xFFFFB300); // Match starRateColor

  // Coral Accents
  static Color darkPrimary = const Color(0xFFFF7043); // Coral
  static Color lightPrimary = const Color(0xCCFF7043); // Coral with 80% opacity
  static Color grey1 = const Color(0xFF616161);
  static Color grey2 = const Color(0xFF9E9E9E);
  static Color white = const Color(0xFFFFFFFF);
  static Color error = const Color(0xFFD32F2F); // Red tone for errors
}

