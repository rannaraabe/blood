import 'dart:ffi';

import 'package:blood_app/app/models/publicacao.dart';
import 'package:blood_app/app/modules/feed/favoritos/widgets/card_favoritos.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

import '../widgets/card_child_feed.dart';
import 'widgets/card_child_favoritos.dart';

class FavoritosPage extends StatefulWidget {
  FavoritosPage({
    Key? key,
    required this.originalList,
  }) : super(key: key);

  final List<CardChildFeed> originalList;

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  List<CardChildFavoritos> cardChildFavoritsList = [];

  Future<void> buildCardFavChilds() async {
    // print("LIST LENGTH -> " + originalList.length.toString());
    // TODO: do a for loop instead, recovering registered starred publication data from backend
    SharedPreferences prefs = await SharedPreferences.getInstance();
    widget.originalList.forEach((publication) {
      /*  print("ID -> " + prefs.getBool(publication.id.toString()).toString());
      print("#1 -> " +
          (prefs.getBool(publication.id.toString()) != null).toString());
      print("#2 -> " +
          (prefs.getBool(publication.id.toString()) == true).toString()); */
      if ((prefs.getBool(publication.id.toString()) != null) &&
          (prefs.getBool(publication.id.toString()) == true)) {
        cardChildFavoritsList.add(
          CardChildFavoritos(
            image: Image.asset(
              'assets/images/djackson123.jpg',
            ),
            publicationHour: publication.publicationHour,
            donee: publication.donee,
            bloodType: publication.bloodType,
            age: publication.age,
            donationCenter: publication.donationCenter,
            urgencyLevel: publication.urgencyLevel,
          ),
        );
      }
    });
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

    return Padding(
        padding: const EdgeInsets.all(32.0),
        child: FutureBuilder<void>(
            future: buildCardFavChilds(),
            builder: (context, snapshot) {
              if (cardChildFavoritsList.isEmpty) {
                return Column(
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
                    SizedBox(
                      width: width,
                      height: height * 0.75,
                      child: Column(children: [
                        Image.asset(
                            'assets/images/nenhuma_publicacao_image.png'),
                        Text(
                          "Nenhuma Publicação Salva",
                          style: AppTheme.regular_medium,
                        )
                      ]),
                    ),
                  ],
                );
              } else {
                return Column(
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
                );
              }
            }));
  }
}
