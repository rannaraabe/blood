import 'package:flutter/material.dart';

class CardFeed extends StatefulWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double width;
  final double height;
  final Widget child;
  final double? paddingTop;

  CardFeed({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.width,
    required this.height,
    this.child = const SizedBox(),
    this.paddingTop,
  }) : super(key: key);

  @override
  _CardFeedState createState() => _CardFeedState();
}

class _CardFeedState extends State<CardFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                color: widget.borderColor,
                blurRadius: 7.0,
                offset: Offset(2.0, 3.0), // shadow direction: bottom right
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(top: widget.paddingTop ?? 0),
          child: Padding(
            padding: EdgeInsets.only(top: widget.height * 0.008),
            child: widget.child,
          ),
        ));
  }
}