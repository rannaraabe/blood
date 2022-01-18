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
            style: AppTheme.style2,
          ),
          Text(
            'salvar vidas!',
            style: AppTheme.style2,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Junte-se à nós e encontre os',
            style: AppTheme.style3,
          ),
          Text(
            'lugares mais próximos para',
            style: AppTheme.style3,
          ),
          Text(
            'fazer a sua doação de sangue.',
            style: AppTheme.style3,
          ),
          Text(
            'Faça parte desse ato de amor.',
            style: AppTheme.style3,
          ),
        ],
      ),
    );
  }
}
