import 'package:flutter/material.dart';

class TextGeneral extends StatelessWidget {
  const TextGeneral(
      {Key? key,
      required this.height,
      required this.width,
      this.hintText,
      this.icon,
      required this.obscureText,
      this.textEditingController})
      : super(key: key);

  final double height;
  final double width;
  final String? hintText;
  final Icon? icon;
  final bool obscureText;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 7.0,
            offset: Offset(2.0, 3.0),
          ),
        ],
      ),
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText,
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
