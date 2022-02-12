import 'package:blood_app/app/modules/feed/favoritos/widgets/card_favoritos.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/card_child_favoritos.dart';

class FavoritosPage extends StatelessWidget {
  List<CardChildFavoritos> cardChildFavoritsList = [];

  void buildCardFavChilds() {
    // TODO: do a for loop instead, recovering registered starred publication data from backend
    cardChildFavoritsList.add(
      CardChildFavoritos(
        image: Image.asset(
          'assets/images/casimiro.jpg',
        ),
        publicationHour: '1 minuto',
        donee: 'Maria Luiza',
        bloodType: '0-',
        age: 6,
        donationCenter: 'Associação de deficientes físicos',
        urgencyLevel: 'Urgente',
      ),
    );
    cardChildFavoritsList.add(
      CardChildFavoritos(
        image: Image.asset(
          'assets/images/casimiro.jpg',
        ),
        publicationHour: '25 minutos',
        donee: 'Letícia Duarte',
        bloodType: 'B+',
        age: 5,
        donationCenter: 'Associação de deficientes físicos',
        urgencyLevel: 'Urgente',
      ),
    );
  }

  Widget favoritesCards(width, height) {
    final cards = <Widget>[];
    for (var cardChildFavorits in cardChildFavoritsList) {
      cards.add(
        CardFavoritos(
          backgroundColor: Color(0XFFF7F7F7),
          borderColor: Color(0XFFF7F7F7),
          width: width * 0.97,
          height: height * 0.18,
          image: cardChildFavorits.image,
          child: cardChildFavorits,
        ),
      );
      cards.add(
        SizedBox(
          height: height * 0.03,
          // height: height * 0.08,
        ),
      );
    }
    return ListView(
      scrollDirection: Axis.vertical,
      children: cards,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    buildCardFavChilds();

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
                padding: EdgeInsets.only(left: width * 0.24),
                child: Text(
                  'Favoritos',
                  style: AppTheme.bold_regular,
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.045,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: width,
              height: height * 0.75,
              child: favoritesCards(width, height),
            ),
          ),
        ],
      ),
    );
  }
}
