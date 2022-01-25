import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    this.feedColor,
    this.mapaColor,
    this.conteudoColor,
    this.contaColor,
    this.conteudo,
  }) : super(key: key);

  final Color? feedColor;
  final Color? mapaColor;
  final Color? conteudoColor;
  final Color? contaColor;
  final double? conteudo;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.04,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: conteudo ?? height * 0.035),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              IconData(0xe318, fontFamily: 'MaterialIcons'),
              color: feedColor ?? Color(0XFFCCCCCC),
              size: width * 0.11,
            ),
            Icon(
              IconData(0xe3ab, fontFamily: 'MaterialIcons'),
              color: mapaColor ?? Color(0XFFCCCCCC),
              size: width * 0.11,
            ),
            Icon(
              IconData(0xe3dd, fontFamily: 'MaterialIcons'),
              color: conteudoColor ?? Color(0XFFCCCCCC),
              size: width * 0.11,
            ),
            Icon(
              IconData(0xe491, fontFamily: 'MaterialIcons'),
              color: contaColor ?? Color(0XFFCCCCCC),
              size: width * 0.11,
            ),
          ],
        ),
      ),
    );
  }
}
