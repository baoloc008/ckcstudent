import 'package:ckcstudent/pages/widgets/general/box_shadow.dart';
import 'package:flutter/material.dart';

class StudentGuideItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BlueBoxShadow],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.add_alert,
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(height: 15),
              Text(
                'Đóng học phí qua MOMO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SFCompactDisplay-Semibold',
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Text(
            'Cập nhật ngày 01/04/2020',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'SFCompactDisplay-Regular',
              fontSize: 9,
            ),
          )
        ],
      ),
    );
  }
}
