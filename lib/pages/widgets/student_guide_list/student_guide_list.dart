import 'package:ckcstudent/pages/widgets/student_guide_list/student_guide_item.dart';
import 'package:flutter/material.dart';

class StudentGuideList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(30),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: List.generate(30, (index) {
        return StudentGuideItem();
      }),
    );
  }
}
