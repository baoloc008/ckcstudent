import 'package:ckcstudent/widgets/box_shadow.dart';
import 'package:ckcstudent/widgets/ckc_web_view.dart';
import 'package:flutter/material.dart';

import 'reminder_list.dart';

class TopBanner extends StatelessWidget {
  final String homepageBannerUrl;

  TopBanner(this.homepageBannerUrl);

  void launchWebView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CKCWebView(
          titleBar: 'CKC STUDENTS',
          url: homepageBannerUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 30,
        top: 30,
        right: 30,
      ),
      padding: EdgeInsets.only(
        left: 28,
        top: 20,
        right: 28,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [BlueBoxShadow],
      ),
      child: GestureDetector(
        onTap: () => launchWebView(context),
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
                  Expanded(
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                  ReminderList(),
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
      ),
    );
  }
}
