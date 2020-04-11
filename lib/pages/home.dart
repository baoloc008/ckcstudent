import 'package:ckcstudent/pages/widgets/category_header.dart';
import 'package:ckcstudent/pages/widgets/category_list.dart';
import 'package:ckcstudent/pages/widgets/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:ckcstudent/pages/widgets/right_appbar.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TopBanner(),
          CategoryHeader(),
          CategoryList(),
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
        titleSpacing: 30,
        title: Text(
          'CKC STUDENTS',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'SFCompactDisplay-Bold',
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 30, bottom: 10),
            child: RightAppBar(),
          )
        ],
      ),
      body: HomePageBody(),
    );
  }
}
