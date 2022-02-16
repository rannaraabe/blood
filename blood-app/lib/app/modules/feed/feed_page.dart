import 'dart:convert';

import 'package:blood_app/app/design_system/top_box_gradient.dart';
import 'package:blood_app/app/modules/feed/favoritos/favoritos_page.dart';
import 'package:blood_app/app/modules/feed/widgets/side_gradient.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:blood_app/app/utils/easy_request.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

import 'feed_controller.dart';
import 'filtros/filtros_page.dart';
import 'publicacao/publicacao_page.dart';
import 'publicacao/widgets/dropdown_button_publicacao.dart';
import 'widgets/card_child_feed.dart';
import 'widgets/card_feed.dart';
import 'widgets/info_feed.dart';
import 'package:http/http.dart' as http;

class FeedPage extends StatefulWidget {
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<CardChildFeed> cardChildFeedList = [];
  FeedController feedController = FeedController();

  void buildCardChilds(List<dynamic> publications) {
    publications.forEach((publication) => {
          cardChildFeedList.add(
            CardChildFeed(
              id: publication['id'],
              image: Image.asset(
                'assets/images/feed_image.png',
              ),
              publicationHour: DateTime.now()
                      .difference(DateTime.parse(
                          publication['dataDeCriacao'].toString()))
                      .inHours
                      .toString() +
                  "Horas", // Definir melhor para casos com maior e menor duração ex: 30 min, 2 dias
              donee: publication['nomeDonatario'],
              bloodType: getBloodType(publication['tipoSanguineo'].toString()),
              age: ((DateTime.now()
                          .difference(DateTime.parse(
                              publication['idadeDonatario'].toString()))
                          .inDays) /
                      365)
                  .floor(),
              donationCenter: Tuple2(
                  publication['unidadeDeDoacao']['endereco']['latitude'],
                  publication['unidadeDeDoacao']['endereco']['longitude']),
              urgencyLevel:
                  getUrgencyLevel(publication['prioridade'].toString()),
              isFavorite: false,
            ),
          )
        });
  }

  Widget feedCards(width, height) {
    final cards = <Widget>[];
    for (var cardChildFeed in cardChildFeedList) {
      cards.add(
        CardFeed(
          backgroundColor: Colors.white,
          borderColor: AppTheme.grey,
          width: width * 0.9,
          height: height * 0.58,
          child: cardChildFeed,
        ),
      );
      cards.add(
        SizedBox(
          height: height * 0.045,
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<CardChildFeed> originalList = cardChildFeedList;
    //buildCardChilds();

    void _showModalBottom(context, widget) {
      FocusManager.instance.primaryFocus?.unfocus();

      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          backgroundColor: Colors.white,
          builder: (BuildContext bc) {
            return Container(height: height * 0.95, child: widget);
          });
    }

    void _showModalBottomFavoritos(context) {
      FocusManager.instance.primaryFocus?.unfocus();

      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          backgroundColor: Colors.white,
          builder: (BuildContext bc) {
            return Container(
                height: height * 0.95,
                child: FavoritosPage(originalList: originalList));
          });
    }

    return Scaffold(
      // bottomNavigationBar: BottonNavBar(),
      resizeToAvoidBottomInset: true,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.005, right: width * 0.01),
        child: Container(
          height: height * 0.08,
          width: height * 0.08,
          child: FloatingActionButton(
            child: Icon(Icons.add, size: width * 0.1),
            backgroundColor: AppTheme.red,
            onPressed: () {
              _showModalBottom(context, PublicacaoPage());
            },
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            TopBoxGradient(),
            Padding(
              padding: EdgeInsets.only(top: height * 0.15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onHorizontalDragEnd: (dragEndDetails) {
                    _showModalBottom(context, FiltrosPage());
                  },
                  child: SideGradient(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.15),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onHorizontalDragStart: (dragStartDetails) {
                    _showModalBottomFavoritos(context);
                  },
                  child: SideGradient(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Olá, ',
                        style: AppTheme.regular_large_white,
                      ),
                      Text(
                        EasyRequest.username,
                        style: AppTheme.bold_large_white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  InfoFeed(
                    width: width * 0.60,
                    height: height * 0.04,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  FutureBuilder<http.Response>(
                      future: EasyRequest.fetchPublications(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                                color: AppTheme.strongRed),
                          );
                        } else if (snapshot.hasData) {
                          print("PUBLICATION");
                          print(snapshot.data?.body);
                          List<dynamic> jsonData =
                              jsonDecode(snapshot.data!.body);

                          buildCardChilds(jsonData);
                          //return Text("Carregou");
                          //Publicacao publicacao = Usuario.fromJson(json.decode(snapshot.data!.body));
                          return SizedBox(
                            width: width * 0.9,
                            height: height * 0.65,
                            child: feedCards(width, height),
                          );
                        } else {
                          return Text("Algo de errado não está certo");
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
