import 'dart:convert';

import 'package:blood_app/app/modules/feed/publicacao/widgets/dropdown_button_publicacao.dart';
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
    String bloodTypeIdx,
    TextEditingController ageController,
    String donationCenterIdx,
    String urgencyLevelIdx) {
  print(ageController.text);
  final response = EasyRequest.cadastrarPublicacao(
      donationCenterIdx, //donationCenterController.text,
      EasyRequest.user_id,
      doneeNameController.text,
      "1", //IMAGE CODE [CORRIGIR DPS]
      ageController.text, // IDADE DONATARIO
      DateTime.now().year.toString() +
          "-" +
          DateTime.now().month.toString() +
          "-" +
          DateTime.now().day.toString(), // DATA CRICACAO
      urgencyLevelIdx,
      bloodTypeIdx);
  response.then((value) => handleResponse(value, context));
}

class PublicacaoPage extends StatefulWidget {
  const PublicacaoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PublicacaoPage> createState() => _PublicacaoPageState();
}

class _PublicacaoPageState extends State<PublicacaoPage> {
  String dropdownDonationCenterValue = 'Onde doar?';
  String dropdownBloodTypeValue = 'Tipo de sangue';
  String dropdownUrgencyLevelValue = 'Nível de Urgência';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextEditingController doneeNameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return Padding(
        padding: EdgeInsets.only(top: height * 0.01),
        child: SizedBox(
          width: width,
          height: height * 0.75,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
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
                      Container(
                        height: height * 0.06,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.black26),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 7.0,
                              offset: Offset(2.0, 3.0),
                            ),
                          ],
                        ),
                        child: DropdownButton<String>(
                          value: dropdownBloodTypeValue,
                          icon: Padding(
                            padding: EdgeInsets.only(left: width * 0.35),
                            child: Icon(
                              IconData(0xf82b, fontFamily: 'MaterialIcons'),
                              color: AppTheme.grey,
                              size: width * 0.1,
                            ),
                          ),
                          style: const TextStyle(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          underline: SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownBloodTypeValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Tipo de sangue',
                            'A+',
                            'B+',
                            'AB+',
                            'O+',
                            'O-',
                            'A-',
                            'B-',
                            'AB-',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
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
                      Container(
                        height: height * 0.06,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.black26),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 7.0,
                              offset: Offset(2.0, 3.0),
                            ),
                          ],
                        ),
                        child: DropdownButton<String>(
                          value: dropdownDonationCenterValue,
                          icon: Padding(
                            padding: EdgeInsets.only(left: width * 0.41),
                            child: Icon(
                              IconData(0xf82b, fontFamily: 'MaterialIcons'),
                              color: AppTheme.grey,
                              size: width * 0.1,
                            ),
                          ),
                          style: const TextStyle(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          underline: SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownDonationCenterValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Onde doar?',
                            'Hemonorte',
                            'Hemovida',
                            'ADEFERN'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.014,
                      ),
                      Container(
                        height: height * 0.06,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.black26),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 7.0,
                              offset: Offset(2.0, 3.0),
                            ),
                          ],
                        ),
                        child: DropdownButton<String>(
                          value: dropdownUrgencyLevelValue,
                          icon: Padding(
                            padding: EdgeInsets.only(left: width * 0.32),
                            child: Icon(
                              IconData(0xf82b, fontFamily: 'MaterialIcons'),
                              color: AppTheme.grey,
                              size: width * 0.1,
                            ),
                          ),
                          style: const TextStyle(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          underline: SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownUrgencyLevelValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Nível de Urgência',
                            'Urgente',
                            'Prioridade média',
                            'Sem urgência'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
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
                                getBloodTypeIdx(dropdownBloodTypeValue),
                                ageController,
                                getDonationCenterIdx(
                                    dropdownDonationCenterValue),
                                getUrgencyLevelIdx(dropdownUrgencyLevelValue),
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
                )),
          ),
        ));
  }
}
