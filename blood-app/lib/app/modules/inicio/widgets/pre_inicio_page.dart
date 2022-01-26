import 'package:blood_app/app/modules/inicio/inicio_page.dart';
import 'package:blood_app/app/modules/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> checkToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? last_token;
  last_token = await prefs.getString('token');

  if (last_token == null) {
    await prefs.setString('token', 'EMPTY');

    return 'EMPTY';
  }

  //return 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsZW9uYW5kcm8iLCJleHAiOjE2NDMxODcwNDUsImlhdCI6MTY0MzE1MTA0NX0.2i6t1w1gEh-8Ks_6X1HNMW6XYik1Qr6ukm3Q7cTV6u8';
  return 'EMPTY';
}

class PreInicioPage extends StatelessWidget {
  const PreInicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<String?>(
          future: checkToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return Text("Houve algum problema com o token");
            } else if (snapshot.hasData && snapshot.data != null) {
              String token = snapshot.data.toString();
              if (token != 'EMPTY') {
                if (JwtDecoder.isExpired(token) ||
                    JwtDecoder.tryDecode(token) == null) {
                  //TODO REDIRECT TO THE LOGIN PAGE
                  print("EXPIRED/INVALID");
                  return Text("LOGIN");
                } else {
                  print("VALID");
                  return MainPage();
                }
              } else {
                print("EMPTY");
                return InicioPage();
              }
            } else {
              return Text("");
            }
          },
        ),
      );
}
