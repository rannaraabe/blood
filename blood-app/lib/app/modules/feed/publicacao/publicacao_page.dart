import 'dart:convert';

import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/easy_request.dart';
import 'widgets/publicacao_text_field.dart';
import 'package:http/http.dart' as http;

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
                  Image.asset('assets/images/undraw_Celebration_re_kc9k.png'),
                  Text(
                    "Pronto, agora você pode voltar ao feed.",
                    textAlign: TextAlign.center,
                    style: AppTheme.style_black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.popUntil(ModalRoute.withName('/feed'));
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
                              'Ok',
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
    TextEditingController doneeNameController,
    TextEditingController bloodTypeController,
    TextEditingController ageController,
    TextEditingController donationCenterController,
    TextEditingController urgencyLevelController) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      handleSubmit(context, doneeNameController, bloodTypeController,
          ageController, donationCenterController, urgencyLevelController);
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
                  Image.asset('assets/images/undraw_home_run_oerh.png'),
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
  print(response.body);

  Map<String, dynamic> jsonData = jsonDecode(response.body);
  if (jsonData['id'] != null) {
    showDoneDialog(context);
  }
  //Modular.to.navigate("/cadastro");
}

void handleSubmit(
    BuildContext context,
    TextEditingController doneeNameController,
    TextEditingController bloodTypeController,
    TextEditingController ageController,
    TextEditingController donationCenterController,
    TextEditingController urgencyLevelController) {
  final response = EasyRequest.cadastrarPublicacao(
      "1", //donationCenterController.text,
      EasyRequest.user_id, // USUÁRIO´[CORRIGIR DPS]
      doneeNameController.text,
      "1", //IMAGE CODE [CORRIGIR DPS]
      "1998-04-06", // IDADE DONATARIO
      "2022-02-13", // DATA CRICACAO
      urgencyLevelController.text,
      bloodTypeController.text);
  response.then((value) => handleResponse(value, context));
}

class PublicacaoPage extends StatelessWidget {
  const PublicacaoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextEditingController doneeNameController = TextEditingController();
    TextEditingController bloodTypeController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController donationCenterController = TextEditingController();
    TextEditingController urgencyLevelController = TextEditingController();

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Modular.to.pop();
                              },
                              child: Icon(IconData(0xf645,
                                  fontFamily: 'MaterialIcons'))),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.15),
                            child: Text(
                              'Criar publicação',
                              style: AppTheme.bold_regular,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Image.asset('assets/images/publicacao_image.png'),
                      Text(
                        'Selecionar imagem',
                        style: AppTheme.semibold_small_gray,
                      ),
                      SizedBox(
                        height: height * 0.065,
                      ),
                      PublicacaoTextField(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: 'Nome completo do donatário',
                        textEditingController: doneeNameController,
                      ),
                      SizedBox(
                        height: height * 0.014,
                      ),
                      PublicacaoTextField(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: 'Tipo de sangue',
                        textEditingController: bloodTypeController,
                      ),
                      SizedBox(
                        height: height * 0.014,
                      ),
                      PublicacaoTextField(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: 'Idade',
                        textEditingController: ageController,
                      ),
                      SizedBox(
                        height: height * 0.014,
                      ),
                      PublicacaoTextField(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: 'Onde doar?',
                        textEditingController: donationCenterController,
                      ),
                      SizedBox(
                        height: height * 0.014,
                      ),
                      PublicacaoTextField(
                        height: height * 0.06,
                        width: width * 0.8,
                        hintText: 'Nível de urgência',
                        textEditingController: urgencyLevelController,
                        icon: Icon(
                          IconData(0xf82b, fontFamily: 'MaterialIcons'),
                          color: AppTheme.grey,
                          size: width * 0.1,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.038,
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: GestureDetector(
                            onTap: () {
                              showLoadingDialog(
                                context,
                                doneeNameController,
                                bloodTypeController,
                                ageController,
                                donationCenterController,
                                urgencyLevelController,
                              );
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
                                      'Publicar',
                                      style: AppTheme.regular_small_white,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ))));
  }
}
