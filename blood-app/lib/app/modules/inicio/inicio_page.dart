import 'package:blood_app/app/modules/inicio/widgets/inicio_button.dart';
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
                Image.asset('assets/images/inicio_image.png'),
                Spacer(),
                TextColumn(),
                Spacer(),
                InicioButton(
                  height: height * 0.06,
                  width: width * 0.8,
                  text: 'Comece aqui',
                ),
                Spacer(),
                Image.asset('assets/images/blood_drop.png'),
              ],
            )));
  }
}
