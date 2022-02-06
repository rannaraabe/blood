import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ConteudoButton extends StatelessWidget {
  const ConteudoButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.provider,
  }) : super(key: key);

  final double height;
  final double width;
  final String text;
  final bool provider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: AppTheme.regular_small_black2,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
