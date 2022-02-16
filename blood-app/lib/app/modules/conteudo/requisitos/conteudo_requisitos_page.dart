import 'package:blood_app/app/modules/conteudo/widgets/info_card1_conteudo.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../conteudo_module.dart';

class ConteudoRequisitosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(32),
          child: ListView(
            children: <Widget>[
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                        child: GestureDetector(
                          onTap: () {
                            //Modular.to.pushNamed('/conteudo');
                            Modular.to
                                .popUntil(ModalRoute.withName('/conteudo'));
                          },
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                    child: Text(
                      'Requisitos Básicos',
                      style: AppTheme.bold_title,
                    ),
                  ),
                  Text(
                    'Atenção! Os requisitos abaixo são definitivos para doação de sangue e devem ser levados em consideração ao doar sangue.',
                    style: AppTheme.bold_small,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Text(
                    '• Doador deve estar em boas condições de saúde.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Ter entre 16 e 69 anos, desde que a primeira doação tenha sido feita até 60 anos.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Doador deve pesar no mínimo 50kg.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Estar descansado (ter dormido pelo menos 6 horas nas últimas 24 horas).',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Estar alimentado (evitar alimentação gordurosa nas 4 horas que antecedem a doação).',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Apresentar documento original com foto recente, que permita a identificação do candidato, emitido por órgão oficial (Carteira de Identidade ou cópia autenticada; Cartão de Identidade de Profissional Liberal; Carteira de Trabalho e Previdência Social; Carteira Nacional de Habilitação, digital ou física; RNE - Registro Nacional de Estrangeiro; Título de Eleitor Digital, desde que tenha a foto; e Passaporte brasileiro com filiação).',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Image.asset(
                    'assets/images/blood_drop.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
