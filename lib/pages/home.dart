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
            "CKC STUDENTS",
            style: TextStyle(fontSize: 20, fontFamily: "SFCompactDisplay-Bold"),
          ),
          Text(
            "Phòng CTCT - HSSV",
            style:
                TextStyle(fontSize: 16, fontFamily: 'SFCompactDisplay-Medium'),
          )
        ],
      ),
    );
  }
}

class RightAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tuần 25",
            style: TextStyle(fontSize: 24, fontFamily: 'SFCompactDisplay-Bold'),
          ),
          Text(
            "Năm học: 2019 - 2020",
            style:
                TextStyle(fontSize: 9, fontFamily: 'SFCompactDisplay-Regular'),
          ),
        ],
      ),
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
              "THÔNG BÁO SINH VIÊN",
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
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset("assets/iconNotification.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
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
                          "Bổ sung hồ sơ HSSV",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'SFCompactDisplay-Semibold',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
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
                          "Nhận xét giảng viên",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'SFCompactDisplay-Semibold',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
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
                          "Miễn giảm kinh phí ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'SFCompactDisplay-Semibold',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
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
                          "Các thông báo khác",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'SFCompactDisplay-Semibold',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "Sinh viên phải thường xuyên cập nhật các thông báo mới trên ứng dụng và website...",
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

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TopBanner(),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 10),
          title: Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  LeftAppBar(), // left content
                  RightAppBar(), // right content
                ],
              ),
            ),
          ),
        ),
      ),
      body: HomePageBody(),
    );
  }
}
