import 'dart:convert';

import 'package:blood_app/app/modules/cadastro/widgets/text_column.dart';
import 'package:blood_app/app/modules/cadastro/widgets/text_general.dart';
import 'package:blood_app/app/modules/inicio/widgets/inicio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/app_theme.dart';
import '../../utils/easy_request.dart';
import 'package:http/http.dart' as http;

import '../../utils/token.dart';

void showDoneDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
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
                    "Pronto, agora você pode realizar seu login.",
                    textAlign: TextAlign.center,
                    style: AppTheme.style_black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.navigate('/login');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: AppTheme.black,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Login',
                              style: AppTheme.regular_small_white,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      );
    },
  );
}

void showLoadingDialog(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController usernameController,
    TextEditingController passwordController,
    TextEditingController emailController,
    TextEditingController bloodTypeController,
    TextEditingController dateController) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      handleSubmit(
          context,
          nameController,
          usernameController,
          passwordController,
          emailController,
          bloodTypeController,
          dateController);
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
                    "Aguarde enquanto estamos cadastrando seus dados",
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

void handleResponse(http.Response response, BuildContext context) async {
  //print(response.body);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> jsonData = jsonDecode(response.body);
  if (jsonData['id'] != null) {
    showDoneDialog(context);
  }
  //Modular.to.navigate("/cadastro");
}

void handleSubmit(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController usernameController,
    TextEditingController passwordController,
    TextEditingController emailController,
    TextEditingController bloodTypeController,
    TextEditingController dateController) {
  final response = EasyRequest.cadastrarUsuatio(
      nameController.text,
      usernameController.text,
      passwordController.text,
      emailController.text,
      dateController.text,
      bloodTypeController.text);
  response.then((value) => handleResponse(value, context));
}

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController bloodTypeController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 0, 15),
                            child: GestureDetector(
                              onTap: () {
                                Modular.to.pushNamed(Modular.initialRoute);
                              },
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ],
                      ),
                      TextColumn(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
                        child: TextGeneral(
                          textEditingController: nameController,
                          height: height * 0.06,
                          width: width * 0.8,
                          hintText: 'Nome completo',
                          obscureText: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: TextGeneral(
                          textEditingController: bloodTypeController,
                          height: height * 0.06,
                          width: width * 0.8,
                          hintText: 'Tipo de sangue',
                          obscureText: false,
                        ),
                      ),
                      Padding(
                        // TODO: abrir DatePicker ao clicar no icon do calendário
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: TextGeneral(
                          textEditingController: dateController,
                          height: height * 0.06,
                          width: width * 0.8,
                          hintText: 'Data de nascimento',
                          icon:
                              Icon(Icons.calendar_today, color: Colors.black26),
                          obscureText: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: TextGeneral(
                          textEditingController: usernameController,
                          height: height * 0.06,
                          width: width * 0.8,
                          hintText: 'Usuário',
                          obscureText: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: TextGeneral(
                          textEditingController: emailController,
                          height: height * 0.06,
                          width: width * 0.8,
                          hintText: 'E-mail',
                          obscureText: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextGeneral(
                          textEditingController: passwordController,
                          height: height * 0.06,
                          width: width * 0.8,
                          hintText: 'Senha',
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.toggle_on,
                              color: Colors.red,
                              size: 60,
                            ),
                            Text(
                              ' Já sou doador de sangue                   ',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: GestureDetector(
                            onTap: () {
                              showLoadingDialog(
                                  context,
                                  nameController,
                                  usernameController,
                                  passwordController,
                                  emailController,
                                  bloodTypeController,
                                  dateController);
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
                                      'Finalizar',
                                      style: AppTheme.regular_small_white,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  )))),
    );
  }
}
