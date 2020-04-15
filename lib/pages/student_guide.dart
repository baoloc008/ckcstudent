import 'package:ckcstudent/pages/widgets/student_guide_list/student_guide_list.dart';
import 'package:flutter/material.dart';

class StudentGuidePage extends StatelessWidget {
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
          child: StudentGuideList(),
        ),
      ),
    );
  }
}
