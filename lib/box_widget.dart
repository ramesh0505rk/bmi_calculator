import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  Widget? childContent;
  Color? backgroundColor;
  final dynamic onPress;
  BoxWidget({this.childContent, this.backgroundColor, this.onPress}) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childContent,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
        ),
      ),
    );
  }
}
