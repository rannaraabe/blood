import 'package:blood_app/app/design_system/bottom_bar.dart';
import 'package:blood_app/app/design_system/top_box_gradient.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'widgets/card_child_feed.dart';
import 'widgets/card_feed.dart';
import 'widgets/info_feed.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.09, right: width * 0.01),
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
                        'Júlia',
                        style: AppTheme.bold_large_white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  InfoFeed(
                    width: width * 0.57,
                    height: height * 0.04,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  CardFeed(
                    backgroundColor: Colors.white,
                    borderColor: AppTheme.grey,
                    width: width * 0.9,
                    height: height * 0.58,
                    child: CardChildFeed(
                      urgencyLevel: 'Urgente',
                    ),
                    // paddingTop: height * 0.0001,
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, height * 0.02),
                    child: BottomBar(
                      feedColor: Color(0XFF323232),
                    ),
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
