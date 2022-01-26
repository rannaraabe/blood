import 'package:blood_app/app/modules/conta/conta_page.dart';
import 'package:blood_app/app/modules/conteudo/conteudo_page.dart';
import 'package:blood_app/app/modules/feed/feed_page.dart';
import 'package:blood_app/app/modules/main/main_controller.dart';
import 'package:blood_app/app/modules/mapa/mapa_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// Defines the navigation between pages
class MainPage extends StatelessWidget {
  final mainStore = MainController();

  final screens = [
    FeedPage(),
    MapaPage(),
    ConteudoPage(),
    ContaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      bottomNavigationBar: Observer( 
        builder: (_) => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Color(0XFFCCCCCC),
          selectedItemColor: Color(0XFF323232),
          currentIndex: mainStore.currentIndex,
          iconSize: width * 0.11,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) => mainStore.updateIndex(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe318, fontFamily: 'MaterialIcons'),
              ),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe3ab, fontFamily: 'MaterialIcons'),
              ),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe3dd, fontFamily: 'MaterialIcons'),
              ),
              label: 'Conteúdo',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe491, fontFamily: 'MaterialIcons'),
              ),
              label: 'Conta',
            ),
          ],
        ),
      ),

      body: 
        // IndexedStack to fix to loose state when changing between pages
        // (Keeps all the childrens alive)
        Observer( 
          builder: (_) =>  IndexedStack(
            index: mainStore.currentIndex,
            children: screens,
          ),
        ),
    );
  }
}