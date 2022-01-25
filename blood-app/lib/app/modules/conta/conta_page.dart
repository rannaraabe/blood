import 'package:blood_app/app/modules/cadastro/widgets/text_general.dart';
import 'package:blood_app/app/design_system/top_box_gradient.dart';

import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class ContaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
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
                            child:
                                Image.asset('assets/images/perfil_image.jpg')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Júlia Nascimento',
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                    "B+",
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
                        hintText: 'Júlia Nascimento Duarte',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextGeneral(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: 'B+',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextGeneral(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: 'julianasd@gmail.com',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextGeneral(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: '14/05/1985',
                        icon: Icon(Icons.calendar_today, color: Colors.black26),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextGeneral(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: '@julianasd',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextGeneral(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: '********',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.black,
                          ),
                          Text(' Sair', style: (AppTheme.semibold_small)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
