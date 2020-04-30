import 'package:flutter/material.dart';

class TopBannerListItem extends StatelessWidget {
  final String text;

  TopBannerListItem({this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.check_circle,
          size: 12,
          color: Colors.white,
        ),
        SizedBox(width: 7),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontFamily: 'SFCompactDisplay-Semibold',
          ),
        ),
      ],
    );
  }
}
