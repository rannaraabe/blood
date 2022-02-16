import 'package:blood_app/app/modules/feed/filtros/filtros_controller.dart';
import 'package:blood_app/app/modules/feed/filtros/widgets/filter_by_distance.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import '../../../theme/app_theme.dart';

class FiltrosPage extends StatefulWidget {
  const FiltrosPage({Key? key}) : super(key: key);

  @override
  State<FiltrosPage> createState() => _FiltrosPageState();
}

class _FiltrosPageState extends State<FiltrosPage> {
  FiltrosController filtrosController = FiltrosController();
  bool aPlusChecked = false;
  Map<String, bool> checklistBloodValues = {
    'A+': false,
    'B+': false,
    'AB+': false,
    'O+': false,
    'O-': false,
    'A-': false,
    'B-': false,
    'AB-': false,
  };

  Map<String, bool> checklistUrgencyValues = {
    'Urgente': false,
    'Prioridade média': false,
    'Sem urgência': false,
  };

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                SizedBox(
                  width: width,
                  height: height * 0.38,
                  child: ListView(
                    children: checklistBloodValues.keys.map((String key) {
                      return CheckboxListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        dense: true,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        title: Text(
                          key,
                          style: AppTheme.regular_gray,
                        ),
                        activeColor: AppTheme.red,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checklistBloodValues[key],
                        onChanged: (bool? value) {
                          setState(() {
                            checklistBloodValues[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: height * 0.004,
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
                SizedBox(
                  width: width,
                  height: height * 0.14,
                  child: ListView(
                    children: checklistUrgencyValues.keys.map((String key) {
                      return CheckboxListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        dense: true,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        title: Text(
                          key,
                          style: AppTheme.regular_gray,
                        ),
                        activeColor: AppTheme.red,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checklistUrgencyValues[key],
                        onChanged: (bool? value) {
                          setState(() {
                            checklistUrgencyValues[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
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
                FilterByDistance(
                  width: width,
                  onTap: () {},
                  text: Text(
                    'Menos de 10 km',
                    style: AppTheme.regular_gray,
                  ),
                ),
                FilterByDistance(
                  width: width,
                  onTap: () {},
                  text: Text(
                    '10km a 50km',
                    style: AppTheme.regular_gray,
                  ),
                ),
                FilterByDistance(
                  width: width,
                  onTap: () {},
                  text: Text(
                    '50km a 100km',
                    style: AppTheme.regular_gray,
                  ),
                ),
                FilterByDistance(
                  width: width,
                  onTap: () {},
                  text: Text(
                    'Mais de 100km',
                    style: AppTheme.regular_gray,
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
          ),
        ),
      ),
    );
  }
}
