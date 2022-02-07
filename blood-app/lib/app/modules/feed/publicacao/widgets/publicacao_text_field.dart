import 'package:blood_app/app/modules/cadastro/widgets/text_general.dart';
import 'package:flutter/material.dart';

class PublicacaoTextField extends StatelessWidget {
  const PublicacaoTextField(
      {Key? key,
      required this.height,
      required this.width,
      required this.hintText,
      this.icon,
      required this.textEditingController})
      : super(key: key);

  final double height;
  final double width;
  final String hintText;
  final Icon? icon;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextGeneral(
      height: height, 
      width: width,
      hintText: hintText,
      icon: icon,
      obscureText: false,
      textEditingController: textEditingController
    );
  }
}
