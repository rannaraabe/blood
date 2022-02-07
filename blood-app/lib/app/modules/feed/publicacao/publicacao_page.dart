import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/publicacao_text_field.dart';

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
