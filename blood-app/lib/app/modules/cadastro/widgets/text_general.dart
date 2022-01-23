import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class TextGeneral extends StatelessWidget {
  const TextGeneral({
    Key? key,
    required this.height,
    required this.width,
    required this.hintText,
    this.icon,
  }) : super(key: key);

  final double height;
  final double width;
  final String hintText;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(color: Colors.black26),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(25, 25, 25, 0),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black26),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black26),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black26),
        ),
      ),
    );
  }
}
