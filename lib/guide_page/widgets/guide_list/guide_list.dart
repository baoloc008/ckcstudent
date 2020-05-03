import 'package:flutter/material.dart';

import 'guide_item.dart';

class GuideList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(30),
      itemCount: 30,
      itemBuilder: (context, index) => GuideItem(),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20,
      ),
    );
  }
}
