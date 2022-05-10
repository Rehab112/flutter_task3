import 'package:flutter/material.dart';

class GreyTxt extends StatelessWidget {
  final String txt;
  GreyTxt(this.txt);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsetsDirectional.only(
        bottom: 7,
      ),
      child: Text(
        txt,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 17,
        ),
      ),
    );
  }
}
