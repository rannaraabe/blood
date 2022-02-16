import 'package:blood_app/app/modules/conteudo/requisitos/conteudo_requisitos_module.dart';
import 'package:blood_app/app/modules/conteudo/widgets/info_card1_conteudo.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'requisitos/conteudo_requisitos_module.dart';
import 'widgets/card_conteudo.dart';
import 'widgets/info_card2_conteudo.dart';
import 'widgets/info_card3_conteudo.dart';

class ConteudoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // bottomNavigationBar: BottonNavBar(),
      resizeToAvoidBottomInset: true,
      body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    CardConteudo(
                      backgroundColor: Colors.black,
                      borderColor: AppTheme.grey,
                      width: width * 0.9,
                      height: height * 0.28,
                      child: InfoCard1Conteudo(),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Honestidade também salva vidas. Ao',
                    style: AppTheme.bold_small,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'doar sangue, seja sincero na',
                    style: AppTheme.bold_small,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'entevista.',
                    style: AppTheme.bold_small,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Image.asset('assets/images/conteudo_image.png'),
                SizedBox(
                  height: height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Atenção aos requisitos!',
                    style: AppTheme.bold_regular,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'É importante que você seja doador e siga todos os requisitos.',
                    style: AppTheme.regular_small_black,
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                SizedBox(
                  width: width * 0.45,
                  height: height * 0.18,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed('/conteudo/requisitos');
                        },
                        child: CardConteudo(
                          backgroundColor: Colors.black,
                          borderColor: AppTheme.grey,
                          width: width * 0.7,
                          height: height * 0.06,
                          child: InfoCard2Conteudo(),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.06,
                      ),
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed('/conteudo/impedimentos');
                        },
                        child: CardConteudo(
                          backgroundColor: Colors.black,
                          borderColor: AppTheme.grey,
                          width: width * 0.7,
                          height: height * 0.06,
                          child: InfoCard3Conteudo(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Image.asset(
                  'assets/images/blood_drop.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
              ],
            ),
          )),
    );
  }
}
