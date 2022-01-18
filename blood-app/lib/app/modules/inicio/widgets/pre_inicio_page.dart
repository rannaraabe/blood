import 'package:blood_app/app/modules/inicio/inicio_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PreInicioPage extends StatelessWidget {
  const PreInicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } 
        // else if (snapshot.hasData) {
          // return FeedPage();
        // }
         else if (snapshot.hasError) {
          return Center(
            child: Text('Algo errado aconteceu!'),
          );
        } else {
          return InicioPage();
        }
      },
    ),
  );
}
