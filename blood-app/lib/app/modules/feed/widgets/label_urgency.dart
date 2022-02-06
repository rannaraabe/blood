import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class LabelUrgency extends StatelessWidget {
  const LabelUrgency({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
  }) : super(key: key);

  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: AppTheme.black,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text.toUpperCase(),
                style: AppTheme.semibold_small_white,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
