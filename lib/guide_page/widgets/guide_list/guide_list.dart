import 'package:flutter/material.dart';

import 'guide_item.dart';

var guideList = [
  {
    'content':  'Xin bảo lưu, thôi học và xin học tiếp',
    'date': 'Cập nhật ngày 01/04/2020',
    'guideType': '1'
  },
  {
    'content':  'Xin bảo lưu, thôi học và xin học tiếp 2',
    'date': 'Cập nhật ngày 01/04/2020',
    'guideType': '2'
  },
  {
    'content':  'Xin bảo lưu, thôi học và xin học tiếp 3',
    'date': 'Cập nhật ngày 01/04/2020',
    'guideType': '3'
  },
  {
    'content':  'Xin bảo lưu, thôi học và xin học tiếp 4',
    'date': 'Cập nhật ngày 01/04/2020',
    'guideType': '4'
  },
  {
    'content':  'Xin bảo lưu, thôi học và xin học tiếp 5',
    'date': 'Cập nhật ngày 01/04/2020',
    'guideType': '5'
  },
  {
    'content':  'Xin bảo lưu, thôi học và xin học tiếp 6',
    'date': 'Cập nhật ngày 01/04/2020',
    'guideType': '6'
  }
];

class GuideList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(30),
      itemCount: guideList.length,
      itemBuilder: (context, index) => GuideItem(
        content: guideList[index]["content"],
        date: guideList[index]["date"],
        guideType: guideList[index]["guideType"],
      ),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20,
      ),
    );
  }
}


//GuideItem(
//content: 'Xin bảo lưu, thôi học và xin học tiếp',
//date: 'Cập nhật ngày 01/04/2020',
//),
//GuideItem(
//content: 'Xin bảo lưu, thôi học và xin học tiếp 2',
//date: 'Cập nhật ngày 01/04/2020',
//),
//GuideItem(
//content: 'Xin bảo lưu, thôi học và xin học tiếp 3',
//date: 'Cập nhật ngày 01/04/2020',
//),