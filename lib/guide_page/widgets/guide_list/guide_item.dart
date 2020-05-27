import 'package:ckcstudent/guide_detail_page/guide.dart';
import 'package:ckcstudent/widgets/box_shadow.dart';
import 'package:flutter/material.dart';

class GuideItem extends StatelessWidget {
  final String content;
  final String date;
  final String guideType;

  GuideItem({this.content, this.date, this.guideType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GuideDetailPage(
            guideType: guideType,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BlueBoxShadow],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(
                  Icons.assessment,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SFCompactDisplay-Semibold',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  date,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SFCompactDisplay-Regular',
                    fontSize: 9,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GuideItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BlueBoxShadow],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.assessment,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    'Xin bảo lưu, thôi học và xin học tiếp',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SFCompactDisplay-Semibold',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
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
      ),
    );
  }
}
