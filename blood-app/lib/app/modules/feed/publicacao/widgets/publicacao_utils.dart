import 'dart:convert';

import 'package:blood_app/app/theme/app_theme.dart';
import 'package:blood_app/app/utils/easy_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          )
        ),
      );
    },
  );
}

void showLoadingDialog(
    BuildContext context,
    TextEditingController doneeNameController,
    String bloodTypeIdx,
    TextEditingController ageController,
    String donationCenterIdx,
    String urgencyLevelIdx) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      handleSubmit(context, doneeNameController, bloodTypeIdx, ageController,
          donationCenterIdx, urgencyLevelIdx);
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
          )
        ),
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
    String bloodTypeIdx,
    TextEditingController ageController,
    String donationCenterIdx,
    String urgencyLevelIdx) {
  final response = EasyRequest.cadastrarPublicacao(
      donationCenterIdx, //donationCenterController.text,
      EasyRequest.user_id,
      doneeNameController.text,
      "1", //IMAGE CODE [CORRIGIR DPS]
      "1998-04-06", // IDADE DONATARIO
      "2022-02-13", // DATA CRICACAO
      urgencyLevelIdx,
      bloodTypeIdx);
  response.then((value) => handleResponse(value, context));
}
