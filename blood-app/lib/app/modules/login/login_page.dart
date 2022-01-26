import 'dart:convert';
import 'dart:ffi';

import 'package:blood_app/app/modules/cadastro/widgets/text_column.dart';
import 'package:blood_app/app/modules/cadastro/widgets/text_general.dart';
import 'package:blood_app/app/modules/inicio/widgets/inicio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/app_theme.dart';
import 'package:http/http.dart' as http;

import '../../utils/easy_request.dart';
import '../../utils/token.dart';

void handleResponse(http.Response response, String username) async {
  print(response.statusCode);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> jsonData = jsonDecode(response.body);
  if (jsonData['jwt'] != null && !JwtDecoder.isExpired(jsonData['jwt'])) {
    EasyRequest.token = Token.fromJson(json.decode(response.body));
    EasyRequest.username = username;
    await prefs.setString('token', jsonData['jwt']);
    await prefs.setString('username', username);
    //print(EasyRequest.token.toString());
    Modular.to.navigate('/main');
  }
  //Modular.to.navigate("/cadastro");
}

void handleSubmit(TextEditingController usernameController,
    TextEditingController passwordController) {
  print("username" + usernameController.text);
  final response =
      EasyRequest.login(usernameController.text, passwordController.text);
  response.then((value) => handleResponse(value, usernameController.text));
}

void showLoginDialog(
    BuildContext context,
    TextEditingController usernameController,
    TextEditingController passwordController) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      handleSubmit(usernameController, passwordController);
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/undraw_in_real_life_v8fk 1.png'),
                  Text(
                    "Aguarde...",
                    textAlign: TextAlign.center,
                    style: AppTheme.style_black,
                  ),
                  CircularProgressIndicator(color: AppTheme.red)
                ],
              ),
            )),
      );
    },
  );
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                reverse: true,
                child: Container(
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
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 0, 15),
                                child: Icon(Icons.arrow_back_ios)),
                          ],
                        ),
                        Image.asset('assets/images/inicio_image.png'),
                        // Spacer(),
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
                            textEditingController: usernameController,
                            height: height * 0.06,
                            width: width * 0.8,
                            hintText: 'Usuário',
                            obscureText: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextGeneral(
                            textEditingController: passwordController,
                            height: height * 0.06,
                            width: width * 0.8,
                            hintText: 'Senha',
                            // TODO: adicionar ação no botão de visualizar senha
                            icon: Icon(Icons.remove_red_eye,
                                color: Colors.black26),
                            obscureText: true,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                            child: GestureDetector(
                              onTap: () {
                                showLoginDialog(context, usernameController,
                                    passwordController);
                              },
                              child: Container(
                                height: height * 0.06,
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  color: AppTheme.black,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Entrar',
                                        style: AppTheme.regular_small_white,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        // Spacer(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                        //Spacer(),
                      ],
                    ),
                  ),
                ))));
  }
}
