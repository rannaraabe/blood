import 'package:blood_app/app/firebase/google_sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_theme.dart';

class InicioButton extends StatelessWidget {
  const InicioButton({
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
      onTap: () {
        Modular.to.pushNamed("/cadastro");
      },
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
                text,
                style: AppTheme.regular_small_white,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
