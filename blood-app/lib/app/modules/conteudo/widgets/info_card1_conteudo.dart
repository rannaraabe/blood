import 'package:blood_app/app/modules/conteudo/widgets/conteudo_button.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InfoCard1Conteudo extends StatelessWidget {
  const InfoCard1Conteudo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.055, top: width * 0.055),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Requisitos para doação',
              style: AppTheme.bold_large_white2,
            ),
          ),
          SizedBox(
            height: height * 0.012,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Os requisitos descritos abaixo obedecem\nàs normas nacionais e internacionais. O\nalto rigor no comprimento dessas\nnormas visa oferecer segurança e\nproteção ao donatário e doador.',
              style: AppTheme.regular_small2_white,
            ),
          ),
          SizedBox(
            height: height * 0.023,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConteudoButton(
              height: height * 0.034,
              width: width * 0.42,
              text: 'Ver documento oficial',
              provider: false,
            ),
          ),
        ],
      ),
    );
  }
}
