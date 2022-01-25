import 'dart:convert';

import 'package:blood_app/app/utils/backend_routes.dart';
import 'package:blood_app/app/utils/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class EasyRequest {
  EasyRequest._();

  static Token token = Token(jwt: "BLOOD ");

  static Future<http.Response> login(String username, String password) async {
    print("entrei na função");
    return await http.post(
      Uri.parse(BackendRoutes.LOGIN),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );
  }

  static Future<http.Response> cadastrarUsuatio(
      String name,
      String username,
      String password,
      String email,
      String dataNascimento,
      String tipoSanguineo) async {
    return await http.post(
      Uri.parse(BackendRoutes.USER),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token.jwt
      },
      body: jsonEncode(<String, String>{
        "nome": name,
        "username": username,
        "password": password,
        "tipoSanguineo": tipoSanguineo,
        "email": email,
        "dataNascimento": dataNascimento
      }),
    );
  }
}
