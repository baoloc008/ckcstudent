import 'dart:convert';

import 'package:ckcstudent/home_page/widgets/category_list/category_list.dart';
import 'package:ckcstudent/home_page/widgets/top_banner/top_banner.dart';
import 'package:ckcstudent/models/app_config.dart';
import 'package:ckcstudent/service.dart';
import 'package:ckcstudent/widgets/image_carousel.dart';
import 'package:ckcstudent/widgets/right_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<AppConfig> future;

  @override
  void initState() {
    super.initState();
    getAppConfig().then((response) {
      print(json.encode(response));
    });
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('appconfig').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }
          print(snapshot.data.documents[0].data['category_list']);
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
            body: ListView(
              children: <Widget>[
                TopBanner(),
                SizedBox(
                  height: 10,
                ),
                CategoryList(),
                ImageCarousel(),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
