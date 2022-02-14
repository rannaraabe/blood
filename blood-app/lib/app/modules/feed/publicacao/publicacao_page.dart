import 'package:blood_app/app/modules/feed/publicacao/widgets/dropdown_button_publicacao.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/publicacao_text_field.dart';
import 'widgets/publicacao_utils.dart';

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
                        child: Icon(
                            IconData(0xf645, fontFamily: 'MaterialIcons'))),
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
                DropdownButtonPublicacao(
                    dropdownValue: dropdownBloodTypeValue,
                    padding: EdgeInsets.only(left: width * 0.35),
                    dropdownMenuItems: <String>[
                      'Tipo de sangue',
                      'A+',
                      'B+',
                      'AB+',
                      'O+',
                      'A-',
                      'B-',
                      'AB-'
                    ],
                    width: width,
                    height: height),
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
                DropdownButtonPublicacao(
                    dropdownValue: dropdownDonationCenterValue,
                    padding: EdgeInsets.only(left: width * 0.41),
                    dropdownMenuItems: <String>[
                      'Onde doar?',
                      'Hemonorte',
                      'Hemolab',
                    ],
                    width: width,
                    height: height),
                SizedBox(
                  height: height * 0.014,
                ),
                DropdownButtonPublicacao(
                    dropdownValue: dropdownUrgencyLevelValue,
                    padding: EdgeInsets.only(left: width * 0.32),
                    dropdownMenuItems: <String>[
                      'Nível de Urgência',
                      'Urgente',
                      'Prioridade média',
                      'Sem urgência'
                    ],
                    width: width,
                    height: height),
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
                          getDonationCenterIdx(dropdownDonationCenterValue),
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
          )
        ),
      ),
    );
  }
}
