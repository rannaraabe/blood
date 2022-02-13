import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/publicacao_text_field.dart';

class PublicacaoPage extends StatefulWidget {
  const PublicacaoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PublicacaoPage> createState() => _PublicacaoPageState();
}

class _PublicacaoPageState extends State<PublicacaoPage> {
  String dropdownValue = 'Nível de Urgência';
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextEditingController doneeNameController = TextEditingController();
    TextEditingController bloodTypeController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController donationCenterController = TextEditingController();

    return Padding(
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
                child: Icon(IconData(0xf645, fontFamily: 'MaterialIcons'))
              ),
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
            child:
              DropdownButton<String>(
                value: dropdownValue,
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
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Nível de Urgência', 'Urgente', 'Prioridade média', 'Sem urgência']
                  .map<DropdownMenuItem<String>>((String value) {
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
                // showLoadingDialog(
                //     context,
                //     nameController,
                //     usernameController,
                //     passwordController,
                //     emailController,
                //     bloodTypeController,
                //     dateController);
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
            )
          ),
        ],
      ),
    );
  }
}
