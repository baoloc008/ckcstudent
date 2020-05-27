import 'package:flutter/material.dart';

class Guide1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Guide 1"),
    );
  }
}

class Guide2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Guide 2"),
    );
  }
}

class Guide3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Guide 3"),
    );
  }
}

class Guide4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Guide 4"),
    );
  }
}

class Guide extends StatelessWidget {
  final String guideType;

  Guide({this.guideType});

  @override
  Widget build(BuildContext context) {
    if (guideType == "1") {
      return Guide1();
    }
    if (guideType == "2") {
      return Guide2();
    }
    if (guideType == "3") {
      return Guide3();
    }
    if (guideType == "4") {
      return Guide4();
    }
    return Container();
  }
}

class GuideDetailPage extends StatelessWidget {
  final String guideType;

  GuideDetailPage({this.guideType});

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
      ),
      body: Guide(
        guideType: guideType,
      ),
    );
  }
}
