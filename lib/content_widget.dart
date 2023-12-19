import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';

class ContentWidget extends StatelessWidget {
  String? imgPath;
  String? text;
  Color? iconColor;

  ContentWidget({this.imgPath, this.text, this.iconColor}) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: SvgPicture.asset(
            imgPath!,
            color: iconColor,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            text!,
            style: TextStyle(
              fontFamily: 'Pacifico',
              color: textColor,
              fontSize: 25,
            ),
          ),
        )
      ],
    );
  }
}
