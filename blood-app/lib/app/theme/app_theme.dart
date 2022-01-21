import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  /// Black #000000
  static const black = Color(0xFF000000);

  /// TextStyle names: style-font + size + color (when it isn't default)
  static const TextStyle regular_small_white = TextStyle(
    fontSize: 18,
    fontFamily: 'IBM Plex Sans',
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle bold_large = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle regular_medium = TextStyle(
    fontSize: 22,
  );
}
