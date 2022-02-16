import 'dart:ffi';

import 'package:blood_app/app/modules/feed/widgets/label_urgency.dart';
import 'package:blood_app/app/modules/inicio/widgets/inicio_button.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:blood_app/app/utils/easy_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../mapa/widgets/mapa_utils.dart';

class CardChildFeed extends StatefulWidget {
  CardChildFeed({
    Key? key,
    required this.id,
    required this.image,
    required this.publicationHour,
    required this.donee,
    required this.bloodType,
    required this.age,
    required this.donationCenter,
    required this.urgencyLevel,
    required this.isFavorite,
  }) : super(key: key);

  final id;
  final Image image;
  final String publicationHour;
  final String donee;
  final String bloodType;
  final int age;
  final Tuple2 donationCenter;
  final String urgencyLevel;
  bool isFavorite;

  @override
  State<CardChildFeed> createState() => _CardChildFeedState();
}

class _CardChildFeedState extends State<CardChildFeed> {
  Future<void> setFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if ((prefs.getBool(widget.id.toString()) != null) &&
        (prefs.getBool(widget.id.toString()) == true)) {
      setState(() {
        widget.isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final edgeInsets = EdgeInsets.fromLTRB(width * 0.04, 0.0, 0, width * 0.006);
    // bool isFavorite = false;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: width * 0.85,
              height: height * 0.32,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.white, width: 3.0),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  child: widget.image),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.025, right: width * 0.06),
                child: LabelUrgency(
                  height: height * 0.035,
                  width: width * 0.27,
                  text: widget.urgencyLevel,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.65,
                top: height * 0.29,
              ),
              child: Container(
                height: height * 0.055,
                width: height * 0.055,
                child: FutureBuilder<void>(
                    future: setFavorite(),
                    builder: (context, snapshot) {
                      return FloatingActionButton(
                        child: Icon(
                          Icons.favorite,
                          color: (widget.isFavorite)
                              ? AppTheme.red
                              : AppTheme.grey,
                          size: 25,
                        ),
                        backgroundColor: Colors.white,
                        onPressed: () async {
                          setState(() {
                            widget.isFavorite = !widget.isFavorite;
                          });
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          bool? isAFavoritePublication =
                              prefs.getBool(this.widget.id.toString());
                          if (isAFavoritePublication != null) {
                            prefs.setBool(this.widget.id.toString(),
                                !isAFavoritePublication);
                          } else {
                            prefs.setBool(this.widget.id.toString(), true);
                          }
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
        Padding(
          padding: edgeInsets,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Há ${widget.publicationHour}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.grey,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.006,
                  ),
                  Text(
                    widget.donee,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Text(
                    '${widget.age} anos',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Há ' +
                        latLongDistance(
                                EasyRequest.user_location.item1,
                                EasyRequest.user_location.item2,
                                widget.donationCenter.item1,
                                widget.donationCenter.item2)
                            .toStringAsFixed(2) +
                        'km de distância',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.007,
                  ),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       IconData(0xe3ab, fontFamily: 'MaterialIcons'),
                  //       color: Color(0XFFCCCCCC),
                  //       size: width * 0.06,
                  //     ),
                  //     Text(
                  //       'Clique aqui para saber onde doar',
                  //       style: TextStyle(
                  //         fontSize: 15,
                  //         fontWeight: FontWeight.w400,
                  //         color: Color(0XFF3480C7),
                  //         decoration: TextDecoration.underline,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: height * 0.017,
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.035, bottom: height * 0.02),
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      Image.asset('assets/images/blood_drop.png'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(widget.bloodType,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'IBM Plex Sans',
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
        /* InicioButton(
          height: height * 0.06,
          width: width * 0.6,
          text: 'Doar',
          route: "",
        ), */
        GestureDetector(
          onTap: () {
            launch("tel://3232-6701");
          },
          child: Container(
            height: height * 0.06,
            width: width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: AppTheme.black,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Doar",
                    style: AppTheme.regular_small_white,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
