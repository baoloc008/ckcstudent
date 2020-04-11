import 'package:flutter/material.dart';

class RightAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tuần 25',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'SFCompactDisplay-Bold',
            ),
          ),
          Text(
            'Năm học: 2019 - 2020',
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
