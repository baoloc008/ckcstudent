import 'package:ckcstudent/pages/widgets/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:ckcstudent/pages/widgets/left_appbar.dart';
import 'package:ckcstudent/pages/widgets/right_appbar.dart';

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
