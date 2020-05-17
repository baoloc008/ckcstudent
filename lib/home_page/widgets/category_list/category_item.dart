import 'package:cached_network_image/cached_network_image.dart';
import 'package:ckcstudent/models/app_config.dart';
import 'package:ckcstudent/widgets/ckc_progress_indicator.dart';
import 'package:ckcstudent/widgets/ckc_web_view.dart';
import 'package:ckcstudent/widgets/box_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  CategoryItem({this.categoryModel});

  @override
  Widget build(BuildContext context) {
    Color placeHolderColor = Theme.of(context).dividerColor;
    Color errorColor = Theme.of(context).errorColor;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CKCWebView(
            titleBar: 'CKC STUDENTS',
            url: categoryModel.url,
          ),
        ),
      ),
      child: Container(
        width: 135,
        height: 135,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BlueBoxShadow],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 50,
              child: CachedNetworkImage(
                imageUrl: categoryModel.icon,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Container(
                  child: CKCProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  child: Icon(
                    Icons.error,
                    color: errorColor,
                    size: 40,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              categoryModel.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SFCompactDisplay-Semibold',
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
