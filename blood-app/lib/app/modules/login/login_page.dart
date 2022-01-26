import 'package:blood_app/app/modules/cadastro/widgets/text_column.dart';
import 'package:blood_app/app/modules/cadastro/widgets/text_general.dart';
import 'package:blood_app/app/modules/inicio/widgets/inicio_button.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      resizeToAvoidBottomInset: true,
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
              Image.asset('assets/images/inicio_image.png'),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem-vindo ao nosso',
                    style: AppTheme.bold_large,
                  ),
                  Text(
                    'time de doadores.',
                    style: AppTheme.bold_large,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      'Estamos felizes em ter',
                      style: AppTheme.regular_medium,
                    ),
                  ),
                  Text(
                    'você conosco!',
                    style: AppTheme.regular_medium,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                child: TextGeneral(
                  height: height * 0.06,
                  width: width * 0.8,
                  hintText: 'Usuário',
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextGeneral(
                  height: height * 0.06,
                  width: width * 0.8,
                  hintText: 'Senha',
                  // TODO: adicionar ação no botão de visualizar senha
                  icon: Icon(Icons.remove_red_eye, color: Colors.black26),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: InicioButton(
                  height: height * 0.06,
                  width: width * 0.8,
                  text: 'Entrar',
                ),
              ),
              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Não tem uma conta? ',
                  style: AppTheme.small_black,
                ),
                Text(
                  'Registre-se',
                  style: AppTheme.bold_small_black,
                ),
              ]),
              Text(
                'Ops, esqueci minha senha!',
                style: AppTheme.bold_small_black,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
