import 'package:flutter/material.dart';

class CardFavoritos extends StatefulWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double width;
  final double height;
  final Widget child;
  final double? paddingTop;
  final Image image;

  CardFavoritos({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.width,
    required this.height,
    this.child = const SizedBox(),
    this.paddingTop,
    required this.image,
  }) : super(key: key);

  @override
  State<CardFavoritos> createState() => _CardFavoritosState();
}

class _CardFavoritosState extends State<CardFavoritos> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    
    return Stack(
      children: [
        Container(
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
              child: widget.child,
            )),
        Padding(
          padding: EdgeInsets.only(top: height * 0.124),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 54,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(4), // Border radius
                child: ClipOval(
                  child: widget.image,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
