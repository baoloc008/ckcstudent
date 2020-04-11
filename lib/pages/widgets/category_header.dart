import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 19, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Danh mục',
            style: TextStyle(
              fontFamily: 'SFCompactDisplay-Semibold',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            'Xem tất cả',
            style: TextStyle(
              fontFamily: 'SFCompactDisplay-Semibold',
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
