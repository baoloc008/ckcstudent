import 'package:flutter/material.dart';

class LeftAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'CKC STUDENTS',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'SFCompactDisplay-Bold',
            ),
          ),
          Text(
            'Phòng CTCT - HSSV',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'SFCompactDisplay-Medium',
            ),
          )
        ],
      ),
    );
  }
}
