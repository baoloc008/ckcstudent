import 'package:flutter/material.dart';

class RightAppBar extends StatelessWidget {
  final String weekText;
  final String yearText;

  RightAppBar({this.weekText, this.yearText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            weekText,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'SFCompactDisplay-Bold',
            ),
          ),
          Text(
            yearText,
            style: TextStyle(
              fontSize: 9,
              fontFamily: 'SFCompactDisplay-Regular',
            ),
          ),
        ],
      ),
    );
  }
}
