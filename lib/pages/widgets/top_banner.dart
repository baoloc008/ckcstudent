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
        SizedBox(
          width: 7,
        ),
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

class TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
      padding: EdgeInsets.fromLTRB(28, 20, 28, 20),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(41, 50, 132, 229),
              offset: Offset(0, 5),
              blurRadius: 16,
              spreadRadius: 0,
            )
          ]),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'THÔNG BÁO SINH VIÊN',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'SFCompactDisplay-Semibold',
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TopBannerListItem(
                      text: 'Bổ sung hồ sơ HSSV',
                    ),
                    SizedBox(height: 12),
                    TopBannerListItem(
                      text: 'Nhận xét giảng viên',
                    ),
                    SizedBox(height: 12),
                    TopBannerListItem(
                      text: 'Miễn giảm kinh phí ',
                    ),
                    SizedBox(height: 12),
                    TopBannerListItem(
                      text: 'Các thông báo khác',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Sinh viên phải thường xuyên cập nhật các thông báo mới trên ứng dụng và website...',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
