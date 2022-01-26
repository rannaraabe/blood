import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InfoCard2Conteudo extends StatelessWidget {
  const InfoCard2Conteudo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.07, top: height * 0.042),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Requisitos básicos',
              style: AppTheme.regular_medium_white,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'O básico também é importante.',
              style: AppTheme.regular_small3_white,
            ),
          ),
        ],
      ),
    );
  }
}
