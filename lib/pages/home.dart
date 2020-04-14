import 'package:ckcstudent/pages/widgets/image_carousel.dart';
import 'package:ckcstudent/pages/widgets/category_header.dart';
import 'package:ckcstudent/pages/widgets/category_list/category_list.dart';
import 'package:ckcstudent/pages/widgets/top_banner/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:ckcstudent/pages/widgets/right_appbar.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          TopBanner(),
          CategoryHeader(),
          CategoryList(),
          ImageCarousel(),
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
        centerTitle: false,
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
