import 'package:flutter/material.dart';

import 'package:blood_app/app/modules/cadastro/widgets/text_column.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../theme/app_theme.dart';

class FiltrosPage extends StatelessWidget {
  const FiltrosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                  child: Icon(IconData(0xf645, fontFamily: 'MaterialIcons'))),
              Padding(
                padding: EdgeInsets.only(left: width * 0.28),
                child: Text(
                  'Filtros',
                  style: AppTheme.bold_regular,
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.038,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Grupo sanguíneo',
                style: AppTheme.medium_gray,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.black54,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.015),
                  child: Text(
                    'A+',
                    style: AppTheme.regular_gray,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.black54,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.015),
                  child: Text(
                    'B+',
                    style: AppTheme.regular_gray,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.black54,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.015),
                  child: Text(
                    'AB+',
                    style: AppTheme.regular_gray,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.black54,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.015),
                  child: Text(
                    'O+',
                    style: AppTheme.regular_gray,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.black54,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.015),
                  child: Text(
                    'O-',
                    style: AppTheme.regular_gray,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.038,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Nível de urgência',
                style: AppTheme.medium_gray,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.black54,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.015),
                  child: Text(
                    'Urgente',
                    style: AppTheme.regular_gray,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.black54,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.015),
                  child: Text(
                    'Sem urgência',
                    style: AppTheme.regular_gray,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.black54,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.015),
                  child: Text(
                    'Prioridade média',
                    style: AppTheme.regular_gray,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.038,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Distância',
                style: AppTheme.medium_gray,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Menos de 10 km',
                  style: AppTheme.regular_gray,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '10km a 50km',
                  style: AppTheme.regular_gray,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '50km a 100km',
                  style: AppTheme.regular_gray,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Mais de 100km',
                  style: AppTheme.regular_gray,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.055,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: GestureDetector(
                onTap: () {},
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
                          'Filtrar',
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
    );
  }
}
