import 'package:ckcstudent/home_page/widgets/category_list/category_list.dart';
import 'package:ckcstudent/home_page/widgets/image_carousel/image_carousel.dart';
import 'package:ckcstudent/home_page/widgets/top_banner/top_banner.dart';
import 'package:ckcstudent/models/app_config.dart';
import 'package:ckcstudent/widgets/ckc_progress_indicator.dart';
import 'package:ckcstudent/widgets/right_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String weekText = "";
  String yearText = "";

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
            child: RightAppBar(
              weekText: this.weekText,
              yearText: this.yearText,
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('appconfig').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text("Đã có lỗi xảy ra, vui lòng thử lại sau!"),
                ],
              ),
            );
          }
          if (!snapshot.hasData) {
            return CKCProgressIndicator();
          }

          AppConfig appConfig =
              AppConfig.fromSnapshot(snapshot.data.documents[0]);

          return ListView(
            children: <Widget>[
              TopBanner(appConfig.homepageBannerUrl),
              SizedBox(height: 10),
              CategoryList(categoryList: appConfig.categoryList),
              ImageCarousel(
                imgList: appConfig.homepageImageList,
                fullImgList: appConfig.homepageFullImageList,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> configTime() async {
    DocumentReference documentReference =
        Firestore.instance.collection("timestamps").document("timeupdate");
    await documentReference
        .setData({"currenttimestamp": FieldValue.serverTimestamp()});
    DocumentSnapshot snapshot = await documentReference.get();
    DocumentSnapshot baseTime = await Firestore.instance
        .collection("timestamps")
        .document("basetime")
        .get();
    int baseTimestamp = baseTime.data["basetimestamp"].millisecondsSinceEpoch;
    int timestamp = snapshot.data["currenttimestamp"].millisecondsSinceEpoch;
    int weekCount =
        ((timestamp - baseTimestamp) / 7 / 24 / 60 / 60 / 1000).floor() + 1;
    int weekNumber = weekCount > 52 ? weekCount % 52 : weekCount;
    int baseYear = DateTime.fromMillisecondsSinceEpoch(baseTimestamp).year;
    int schoolYear = baseYear + (weekCount > 52 ? (weekCount / 52).floor() : 0);
    setState(() {
      this.weekText = 'Tuần ${weekNumber.toString().padLeft(2, '0')}';
      this.yearText = 'Năm học ' + '$schoolYear - ${schoolYear + 1}';
    });
  }

  @override
  void initState() {
    super.initState();
    configTime();
  }
}
