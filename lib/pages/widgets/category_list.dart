import 'package:flutter/material.dart';

var categoryList = [1, 2, 3];

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
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(41, 50, 132, 229),
            blurRadius: 16,
            spreadRadius: 0,
            offset: Offset(0, 5),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.add_alert,
            color: Theme.of(context).primaryColor,
            size: 50,
          ),
          SizedBox(
            height: 15,
          ),
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

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167.0, // 167 = 135 + 16 * 2
      margin: EdgeInsets.only(
        top: 8, // 19 - blurRadius - offset.y
      ),
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 30,
          top: 11, // equal equal blurRadius - offset.y
          right: 30,
          bottom: 21, // equal blurRadius + offset.y
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}
