import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InfoFeed extends StatelessWidget {
  const InfoFeed({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: width,
        height: height,
        color: Color(0xFFFFFFFF).withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Deslize para cima para ver o próximo',
              style: AppTheme.regular_smallest_white,
            ),
          ],
        ),
      ),
    );
  }
}
