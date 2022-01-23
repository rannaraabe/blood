import 'package:blood_app/app/modules/cadastro/widgets/text_column.dart';
import 'package:blood_app/app/modules/cadastro/widgets/text_general.dart';
import 'package:blood_app/app/modules/inicio/widgets/inicio_button.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    // TODO: adicionar ação no botão de voltar
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                          child: Icon(Icons.arrow_back_ios)),
                    ],
                  ),
                  TextColumn(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 15),
                    child: TextGeneral(
                      height: height * 0.06,
                      width: width * 0.8,
                      hintText: 'Nome completo',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextGeneral(
                      height: height * 0.06,
                      width: width * 0.8,
                      hintText: 'Tipo de sangue',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextGeneral(
                      height: height * 0.06,
                      width: width * 0.8,
                      hintText: 'Gênero',
                    ),
                  ),
                  Padding(
                    // TODO: abrir DatePicker ao clicar no icon do calendário
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: TextGeneral(
                      height: height * 0.06,
                      width: width * 0.8,
                      hintText: 'Data de nascimento',
                      icon: Icon(Icons.calendar_today, color: Colors.black26),
                    ),
                  ),
                  Padding(
                    // TODO: adicionar ação ao clicar no icon de Toggle
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.toggle_off,
                          color: Colors.black26,
                          size: 60,
                        ),
                        Text(
                          ' Já sou doador de sangue                   ',
                          style: TextStyle(fontSize: 16, color: Colors.black26),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: InicioButton(
                      height: height * 0.06,
                      width: width * 0.8,
                      text: 'Finalizar',
                    ),
                  ),
                  Image.asset('assets/images/blood_drop.png'),
                ],
              ))),
    );
  }
}
