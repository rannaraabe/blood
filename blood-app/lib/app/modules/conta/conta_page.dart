import 'dart:convert';

import 'package:blood_app/app/models/usuario.dart';
import 'package:blood_app/app/modules/cadastro/widgets/text_general.dart';
import 'package:blood_app/app/design_system/top_box_gradient.dart';
import 'package:blood_app/app/modules/feed/publicacao/widgets/dropdown_button_publicacao.dart';
import 'package:blood_app/app/utils/easy_request.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/app_theme.dart';
import 'package:http/http.dart' as http;

void handleLogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  EasyRequest.token.jwt = EasyRequest.expired_token;
  prefs.setString('token', EasyRequest.expired_token);
  Modular.to.navigate('/login');
}

void handleAccountDeletion() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  EasyRequest.token.jwt = 'EMPTY';
  prefs.setString('token', 'EMPTY');
  Modular.to.navigate(Modular.initialRoute);
}

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(Duration(milliseconds: 1500), () {
        handleLogout();
      });

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
                    "Te esperamos de volta! Aguarde enquanto finalizamos.",
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

class ContaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder<http.Response>(
      future: EasyRequest.fetchUser(EasyRequest.username),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(color: AppTheme.strongRed),
          );
        } else if (snapshot.hasData) {
          print(snapshot.data?.body);
          Map<String, dynamic> jsonData = jsonDecode(snapshot.data!.body);
          EasyRequest.user_id = jsonData['id'].toString();
          Usuario user = Usuario.fromJson(json.decode(snapshot.data!.body));
          return SizedBox(
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  TopBoxGradient(),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(4), // Border radius
                            child: ClipOval(
                                child: Image.asset('assets/images/' +
                                    EasyRequest.username +
                                    '.jpg')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user.nome,
                                style: AppTheme.bold_large_white,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 110,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 7.0,
                                  offset: Offset(2.0, 3.0),
                                ),
                              ],
                            ),
                            child: Column(children: [
                              Row(children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(18, 23, 0, 0),
                                    child: Column(children: [
                                      Icon(
                                        Icons.volunteer_activism,
                                        color: Color(0xFFF28888),
                                        size: 30,
                                      ),
                                      Text(
                                        "14",
                                        style: AppTheme.semibold_small_red,
                                      ),
                                      Text(
                                        "Vidas salvas",
                                        style: AppTheme.semibold_small_gray,
                                      ),
                                    ])),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(18, 23, 0, 0),
                                    child: Column(children: [
                                      Icon(
                                        Icons.opacity,
                                        color: Color(0xFFF28888),
                                        size: 30,
                                      ),
                                      Text(
                                        getBloodType(
                                            user.tipoSanguineo.toString()),
                                        style: AppTheme.semibold_small_red,
                                      ),
                                      Text(
                                        "Grupo sanguíneo",
                                        style: AppTheme.semibold_small_gray,
                                      ),
                                    ])),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(18, 23, 0, 0),
                                    child: Column(children: [
                                      Icon(
                                        Icons.calendar_today,
                                        color: Color(0xFFF28888),
                                        size: 30,
                                      ),
                                      Text(
                                        "7 mar",
                                        style: AppTheme.semibold_small_red,
                                      ),
                                      Text(
                                        "Pŕoxima doação",
                                        style: AppTheme.semibold_small_gray,
                                      ),
                                    ])),
                              ]),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                          child: TextGeneral(
                            height: height * 0.06,
                            width: width * 0.8,
                            hintText: user.nome,
                            obscureText: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextGeneral(
                            height: height * 0.06,
                            width: width * 0.8,
                            hintText: 'A+',
                            obscureText: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextGeneral(
                            height: height * 0.06,
                            width: width * 0.8,
                            hintText: user.email,
                            obscureText: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextGeneral(
                            height: height * 0.06,
                            width: width * 0.8,
                            hintText: DateTime.parse(user.dataNascimento)
                                    .day
                                    .toString() +
                                "/" +
                                DateTime.parse(user.dataNascimento)
                                    .month
                                    .toString() +
                                "/" +
                                DateTime.parse(user.dataNascimento)
                                    .year
                                    .toString(),
                            icon: Icon(Icons.calendar_today,
                                color: Colors.black26),
                            obscureText: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextGeneral(
                            height: height * 0.06,
                            width: width * 0.8,
                            hintText: user.username,
                            obscureText: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: TextGeneral(
                            height: height * 0.06,
                            width: width * 0.8,
                            hintText: '********',
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: GestureDetector(
                              onDoubleTap: () {
                                handleAccountDeletion();
                              },
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_forever,
                                    color: Color(0xFFFF0032),
                                  ),
                                  Text(' Desejo deletar minha conta',
                                      style: (AppTheme.semibold_small_delete)),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: GestureDetector(
                              onTap: () {
                                showLogoutDialog(context);
                              },
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.exit_to_app,
                                    color: Colors.black,
                                  ),
                                  Text(' Sair',
                                      style: (AppTheme.semibold_small)),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Text("Algo de errado não está certo");
        }
      },
    ));
  }
}
