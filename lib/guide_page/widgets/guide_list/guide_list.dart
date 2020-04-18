import 'package:flutter/material.dart';

import 'guide_item.dart';

class GuideList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(30),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: List.generate(30, (index) {
        return GuideItem();
      }),
    );
  }
}
