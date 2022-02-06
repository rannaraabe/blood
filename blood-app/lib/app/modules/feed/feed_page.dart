import 'package:blood_app/app/design_system/top_box_gradient.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:blood_app/app/utils/easy_request.dart';
import 'package:flutter/material.dart';

import 'widgets/card_child_feed.dart';
import 'widgets/card_feed.dart';
import 'widgets/info_feed.dart';

class FeedPage extends StatelessWidget {
  List<CardChildFeed> cardChildFeedList = [];

  void buildCardChilds() {
    // TODO: do a for loop instead, recovering registered publication data from backend
    cardChildFeedList.add(
      CardChildFeed(
        image: Image.asset('assets/images/feed_image.png',),
        publicationHour: '1 minuto',
        donee: 'Maria Luiza',
        bloodType: '0-',
        age: 6,
        donationCenter: 'Associação de deficientes físicos',
        urgencyLevel: 'Urgente',
      ),
    );
    cardChildFeedList.add(
      CardChildFeed(
        image: Image.asset('assets/images/feed_image2.jpg',),
        publicationHour: '25 minutos',
        donee: 'Letícia Duarte',
        bloodType: 'B+',
        age: 5,
        donationCenter: 'Associação de deficientes físicos',
        urgencyLevel: 'Urgente',
      ),
    );
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
      children:
        cards,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    buildCardChilds();

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
            onPressed: () {},
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            TopBoxGradient(),
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
                  SizedBox(
                    width: width * 0.9,
                    height: height * 0.65,
                    child: feedCards(width, height),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
