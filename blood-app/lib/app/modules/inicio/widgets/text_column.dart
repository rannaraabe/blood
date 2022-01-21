import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class TextColumn extends StatelessWidget {
  const TextColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Seu sangue pode',
            style: AppTheme.bold_large,
          ),
          Text(
            'salvar vidas!',
            style: AppTheme.bold_large,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '',
          ),
          Text(
            'Junte-se à nós e encontre os',
            style: AppTheme.regular_medium,
          ),
          Text(
            'lugares mais próximos para',
            style: AppTheme.regular_medium,
          ),
          Text(
            'fazer a sua doação de sangue.',
            style: AppTheme.regular_medium,
          ),
          Text(
            'Faça parte desse ato de amor.',
            style: AppTheme.regular_medium,
          ),
        ],
      ),
    );
  }
}
