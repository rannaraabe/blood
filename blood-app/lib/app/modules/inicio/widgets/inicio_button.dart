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
    required this.provider,
  }) : super(key: key);

  final double height;
  final double width;
  final String text;
  final bool provider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Provider(provedor de código): abstrai o padrão singleton => instância única para o app inteiro
        if (provider) {
          Modular.to.navigate('/cadastro');
        }
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
