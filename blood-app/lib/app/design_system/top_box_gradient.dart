import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TopBoxGradient extends StatelessWidget {
  const TopBoxGradient({ Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.27,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(120), bottomRight: Radius.circular(120)),
        color: Colors.white,
        gradient: AppTheme.backgroundGradient,
        boxShadow: const [
          BoxShadow(
            color: AppTheme.pink,
            spreadRadius: 30,
            blurRadius: 12,
          ),
        ],
      ),
    );
  }
}