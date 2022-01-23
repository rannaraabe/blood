import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class TextColumn extends StatelessWidget {
  const TextColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Faça parte do nosso',
          style: AppTheme.bold_large,
        ),
        Text(
          'time de doadores.',
          style: AppTheme.bold_large,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Estamos felizes em ter',
          style: AppTheme.regular_medium,
        ),
        Text(
          'você conosco! Você está a',
          style: AppTheme.regular_medium,
        ),
        Text(
          'um passo de se tornar um',
          style: AppTheme.regular_medium,
        ),
        Text(
          'doador! Precisamos apenas',
          style: AppTheme.regular_medium,
        ),
        Text(
          'de algumas informações.',
          style: AppTheme.regular_medium,
        ),
      ],
    );
  }
}
