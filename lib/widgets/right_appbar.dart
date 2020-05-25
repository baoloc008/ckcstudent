import 'package:flutter/material.dart';

class RightAppBar extends StatelessWidget {
  final int weekNumber;

  RightAppBar({this.weekNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            weekNumber > 0 ? "Tuần " + weekNumber.toString() : "",
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
