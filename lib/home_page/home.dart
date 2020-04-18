import 'package:ckcstudent/home_page/widgets/category_list/category_list.dart';
import 'package:ckcstudent/home_page/widgets/top_banner/top_banner.dart';
import 'package:ckcstudent/models/app_config.dart';
import 'package:ckcstudent/widgets/image_carousel.dart';
import 'package:ckcstudent/widgets/right_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//  }

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
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('appconfig').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CupertinoActivityIndicator(radius: 20);
              }
              return ListView(
                children: <Widget>[
                  TopBanner(),
                  SizedBox(
                    height: 10,
                  ),
                  CategoryList(
                    categoryList: AppConfig.fromSnapshot(snapshot.data.documents[0]).categoryList
                  ),
                  ImageCarousel(),
                ],
              );
            })
//      body: Consumer<HomeBloc>(
//        builder: (context, bloc, child) => StreamBuilder<AppConfig>(
//          stream: bloc.homeStream,
//          builder: (context, snapShot) {
//            print('snapShot.data ${snapShot.data}');
//            switch (snapShot.connectionState) {
//              case ConnectionState.active:
//                print('snapShot.data ${snapShot.data.categorylist}');
//
//                return ListView(
//                  children: <Widget>[
//                    TopBanner(),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    CategoryList(),
//                    ImageCarousel(),
//                  ],
//                );
//              case ConnectionState.none:
//              default:
//                return Center(
//                  child: Container(
//                    child: CupertinoActivityIndicator(
//                      radius: 20,
//                    ),
//                  ),
//                );
//            }
//          },
//        ),
//      ),
        );
  }
}
