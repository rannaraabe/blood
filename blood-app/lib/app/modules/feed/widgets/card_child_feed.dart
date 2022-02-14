import 'package:blood_app/app/modules/feed/widgets/label_urgency.dart';
import 'package:blood_app/app/modules/inicio/widgets/inicio_button.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardChildFeed extends StatelessWidget {
  const CardChildFeed({
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
  final String donationCenter;
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
                child: image
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.025, right: width * 0.06),
                child: LabelUrgency(
                  height: height * 0.035,
                  width: width * 0.27,
                  text: urgencyLevel,
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
                child: FloatingActionButton(
                  child: Image.asset(
                    'assets/images/hearth.png',
                    height: height * 0.44,
                    width: width * 0.44,
                  ),
                  backgroundColor: Colors.white,
                  onPressed: () {},
                ),
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
                    'Há $publicationHour',
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
                    donee,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Text(
                    '$age anos, 20 km de distância',
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
                    height: height * 0.017,
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.009, bottom: height * 0.02),
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      Image.asset('assets/images/blood_drop.png'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(bloodType,
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
        InicioButton(
          height: height * 0.06,
          width: width * 0.6,
          text: 'Doar',
        ),
      ],
    );
  }
}
