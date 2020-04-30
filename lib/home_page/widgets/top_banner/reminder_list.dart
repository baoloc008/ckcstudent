import 'package:flutter/material.dart';

import 'list_item.dart';

class ReminderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
