import 'package:ckcstudent/guide_page/widgets/guide_list/guide_list.dart';
import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Hướng dẫn',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'SFCompactDisplay-Bold',
            ),
          ),
        ),
        body: Container(
          child: GuideList(),
        ),
      ),
    );
  }
}
