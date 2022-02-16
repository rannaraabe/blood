import 'package:blood_app/app/modules/inicio/widgets/inicio_button.dart';
import 'package:blood_app/app/modules/inicio/widgets/overlap_button.dart';
import 'package:blood_app/app/modules/inicio/widgets/text_column.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/inicio.png'),
                TextColumn(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 35),
                  child: Image.asset('assets/images/blood_drop.png'),
                ),
                SizedBox(
                  width: 320,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 115.0,
                        child: InicioButton(
                          height: height * 0.06,
                          width: width * 0.50,
                          text: '     Registre-se',
                          route: "/cadastro",
                        ),
                      ),
                      Positioned(
                        child: OverlapButton(
                          height: height * 0.06,
                          width: width * 0.39,
                          text: 'Entre',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
