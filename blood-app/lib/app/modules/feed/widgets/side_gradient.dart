import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SideGradient extends StatelessWidget {
  const SideGradient({ Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.04,
      height: height * 0.04,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: AppTheme.sideGradient,
        boxShadow: const [
          BoxShadow(
            color: AppTheme.roseQuartz,
            spreadRadius: 30,
            blurRadius: 12,
          ),
        ],
      ),
    );
  }
}