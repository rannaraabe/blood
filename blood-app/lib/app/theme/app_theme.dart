import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  /// Black #000000
  static const black = Color(0xFF000000);
  static const strongRed = Color.fromARGB(255, 255, 0, 50);

  static const TextStyle style1 = TextStyle(
    fontSize: 17,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle style2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle style3 = TextStyle(
    fontSize: 19,
  );

  static const TextStyle style4 = TextStyle(
    fontSize: 17,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle redTitle = TextStyle(
    fontSize: 18,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w800,
    color: strongRed,
  );
}
