import 'package:ckcstudent/models/app_config.dart';
import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categoryList;

  CategoryList({this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167.0, // 167 = 135 + 16 * 2
      margin: EdgeInsets.only(
        top: 8, // 19 - blurRadius - offset.y
      ),
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 30,
          top: 11, // equal equal blurRadius - offset.y
          right: 30,
          bottom: 21, // equal blurRadius + offset.y
        ),
        itemCount: this.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryModel: categoryList[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 20);
        },
      ),
    );
  }
}
