import 'package:ckcstudent/widgets/general/box_shadow.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  // String text;
  // String imageSrc;
  // CategoryItem({this.text, this.imageSrc});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      height: 135,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BlueBoxShadow],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.add_alert,
            color: Theme.of(context).primaryColor,
            size: 50,
          ),
          SizedBox(height: 15),
          Text(
            'Nội dung sinh hoạt chủ nhiệm',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'SFCompactDisplay-Semibold',
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
