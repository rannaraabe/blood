import 'dart:convert';

import 'package:blood_app/app/utils/backend_routes.dart';
import 'package:blood_app/app/utils/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class EasyRequest {
  EasyRequest._();

  static Token token = Token(jwt: "BLOOD ");
  static String username = "";
  static String user_id = "";
  static String expired_token =
      'eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTY0Mjk5Njk0OSwiaWF0IjoxNjQyOTEwNTQ5fQ.s1DEKRaQad8JWpnos4GlmPzag2Phb4-_v1kTszrVtc8';

  static Future<http.Response> login(String username, String password) async {
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
    return await http.post(Uri.parse(BackendRoutes.USER),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "nome": name,
          "username": username,
          "password": password,
          "tipoSanguineo": tipoSanguineo,
          "email": email,
          "dataNascimento": dataNascimento
        }));
  }

  static Future<http.Response> fetchUser(String username) async {
    return await http.get(
      Uri.parse(BackendRoutes.USER_BYUSERNAME + username),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Authorization':
        //    'BLOOD eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsZW9uYW5kcm8iLCJleHAiOjE2NDMxODcwNDUsImlhdCI6MTY0MzE1MTA0NX0.2i6t1w1gEh-8Ks_6X1HNMW6XYik1Qr6ukm3Q7cTV6u8'
        'Authorization': token.jwt
      },
    );
  }

  static Future<http.Response> fetchPublications() async {
    return await http.get(
      Uri.parse(BackendRoutes.PUBLICATION),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token.jwt
      },
    );
  }

  static Future<http.Response> cadastrarPublicacao(
      String unidadeDoacao,
      String usuario,
      String nomeDonatario,
      String imageCode,
      String idadeDonatario,
      String dataCriacao,
      String prioridade,
      String tipoSanguineo) async {
    print("CADASTRANDO");
    return await http.post(Uri.parse(BackendRoutes.PUBLICATION),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token.jwt
        },
        body: jsonEncode(<String, String>{
          "unidadeDoacao": unidadeDoacao,
          "usuario": usuario,
          "nomeDonatario": nomeDonatario,
          "imageCode": imageCode,
          "idadeDonatario": idadeDonatario,
          "dataCriacao": dataCriacao,
          "prioridade": prioridade,
          "tipoSanguineo": tipoSanguineo
        }));
  }
}
