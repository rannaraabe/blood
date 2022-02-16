import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  /// Black #000000
  static const black = Color(0xFF000000);
  static const strongRed = Color.fromARGB(255, 255, 0, 50);

  /// Red #FF0032
  static const red = Color(0xFFFF0032);

  /// Pink #0xFFF28888
  static const pink = Color(0xFFF28888);

  /// Grey #CCCCCC
  static const grey = Color(0XFFCCCCCC);

  /// Rose Quartz #FADCD9
  static const roseQuartz = Color(0xFFFADCD9);

  /// Background gradient
  static const RadialGradient backgroundGradient = RadialGradient(colors: [
    Color(0xFFFF0032),
    Color(0xFFFF0032),
    Color(0xFFF28888),
  ], radius: 1);

  /// Background gradient
  static const RadialGradient sideGradient = RadialGradient(colors: [
    roseQuartz,
    roseQuartz,
  ], radius: 1);

  /// TextStyle names: style-font + size + color (when it isn't default)
  static const TextStyle regular_smallest_white = TextStyle(
    fontSize: 11.6,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  /// TextStyle names: style-font + size + color (when it isn't default)
  static const TextStyle regular_small_white = TextStyle(
    fontSize: 18,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle regular_small2_white = TextStyle(
    fontSize: 15.5,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle regular_small3_white = TextStyle(
    fontSize: 15.7,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle regular_medium_white = TextStyle(
    fontSize: 24,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle regular_large_white = TextStyle(
    fontSize: 26,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle bold_large_white = TextStyle(
    fontSize: 26,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle bold_large_white2 = TextStyle(
    fontSize: 20,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle bold_large = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bold_regular = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bold_small = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle regular_small_black = TextStyle(
    fontSize: 14.2,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle regular_small_black2 = TextStyle(
    fontSize: 12,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle regular_medium = TextStyle(
    fontSize: 22,
  );

  static const TextStyle semibold_small_white = TextStyle(
    fontSize: 13, //15
    fontFamily: 'IBM Plex Sans',
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle semibold_small_red = TextStyle(
    fontSize: 17,
    fontFamily: 'IBM Plex Sans',
    color: Color(0xFFF28888),
    fontWeight: FontWeight.w600,
  );

  static const TextStyle semibold_small_gray = TextStyle(
    fontSize: 13,
    fontFamily: 'IBM Plex Sans',
    color: Colors.black26,
  );

  static const TextStyle semibold_small = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: 'IBM Plex Sans',
  );

  static const TextStyle semibold_small_delete = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: 'IBM Plex Sans',
    color: Color(0xFFFF0032),
  );

  static const TextStyle style_white = TextStyle(
    fontSize: 17,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle style_black = TextStyle(
    fontSize: 17,
    fontFamily: 'IBM Plex Sans',
    // fontWeight: FontWeight.w500,
    color: Colors.black38,
  );

  static const TextStyle redTitle = TextStyle(
    fontSize: 18,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w800,
    color: strongRed,
  );

  static const TextStyle regular_card = TextStyle(
    fontSize: 18,
  );

  static const TextStyle small_white = TextStyle(
    fontSize: 14,
    fontFamily: 'IBM Plex Sans',
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle small_black = TextStyle(
    fontSize: 14,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bold_small_black = TextStyle(
    fontSize: 14,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle regular_small4_white = TextStyle(
    fontSize: 15,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle medium_gray = TextStyle(
    fontSize: 20,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );

  static const TextStyle regular_gray = TextStyle(
    fontSize: 20,
    fontFamily: 'IBM Plex Sans',
    color: Colors.black54,
  );

  static const TextStyle medium_regular = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bold_title = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFF0032),
  );
}
