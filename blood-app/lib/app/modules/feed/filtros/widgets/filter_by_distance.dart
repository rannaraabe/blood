import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FilterByDistance extends StatelessWidget {
  const FilterByDistance({
    Key? key,
    required this.width,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final double width;
  final void Function()? onTap;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: width * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: text,
          ),
        ],
      ),
    );
  }
}
