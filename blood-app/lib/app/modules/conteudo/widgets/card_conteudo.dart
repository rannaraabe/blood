import 'package:blood_app/app/modules/feed/widgets/card_feed.dart';
import 'package:flutter/material.dart';

class CardConteudo extends StatelessWidget {
  const CardConteudo({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.width,
    required this.height,
    this.child = const SizedBox(),
    this.paddingTop,
  }) : super(key: key);

  final Color backgroundColor;
  final Color borderColor;
  final double width;
  final double height;
  final Widget child;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return CardFeed(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      width: width,
      height: height,
      child: child,
      paddingTop: paddingTop,
    );
  }
}
