import 'package:blood_app/app/modules/feed/widgets/label_urgency.dart';
import 'package:blood_app/app/modules/mapa/widgets/mapa_utils.dart';
import 'package:blood_app/app/utils/easy_request.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class CardChildFavoritos extends StatelessWidget {
  const CardChildFavoritos({
    Key? key,
    required this.image,
    required this.publicationHour,
    required this.donee,
    required this.bloodType,
    required this.age,
    required this.donationCenter,
    required this.urgencyLevel,
  }) : super(key: key);

  final Image image;
  final String publicationHour;
  final String donee;
  final String bloodType;
  final int age;
  final Tuple2 donationCenter;
  final String urgencyLevel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final edgeInsets = EdgeInsets.fromLTRB(width * 0.04, 0.0, 0, width * 0.006);
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: edgeInsets,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        donee + ", " + bloodType,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.001,
                      ),
                      Text(
                        '$age anos, ' +
                            latLongDistance(
                                    EasyRequest.user_location.item1,
                                    EasyRequest.user_location.item2,
                                    donationCenter.item1,
                                    donationCenter.item2)
                                .toStringAsFixed(2) +
                            'km',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      Row(
                        children: [
                          Icon(
                            IconData(0xe3ab, fontFamily: 'MaterialIcons'),
                            color: Color(0XFFCCCCCC),
                            size: width * 0.06,
                          ),
                          Text(
                            'Clique aqui para saber onde doar',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF3480C7),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Image.asset(
                        'assets/images/hearth.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.014, right: width * 0.04),
                child: LabelUrgency(
                  height: height * 0.035,
                  width: width * 0.22,
                  text: urgencyLevel,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
