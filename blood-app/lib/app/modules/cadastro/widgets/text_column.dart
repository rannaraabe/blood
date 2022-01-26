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
          'Você está a um passo de se',
          style: AppTheme.regular_medium,
        ),
        Text(
          'tornar um doador! Precisamos',
          style: AppTheme.regular_medium,
        ),
        Text(
          'apenas de algumas das suas',
          style: AppTheme.regular_medium,
        ),
        Text(
          'informações.',
          style: AppTheme.regular_medium,
        ),
      ],
    );
  }
}
