import 'package:cached_network_image/cached_network_image.dart';
import 'package:ckcstudent/models/app_config.dart';
import 'package:ckcstudent/widgets/box_shadow.dart';
import 'package:ckcstudent/widgets/ckc_progress_indicator.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  static const platform = const MethodChannel('vn.edu.ckcstudent/webview');

  CategoryItem({this.categoryModel});

  Future<void> _launchWebView() async {
    try {
      final int result = await platform
          .invokeMethod('launchWebView', {'url': categoryModel.url});
      if (result != 1) {
        throw ('launch web view error');
      }
    } catch (e, stack) {
      Crashlytics.instance.recordError(e, stack);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color errorColor = Theme.of(context).errorColor;
    return GestureDetector(
      onTap: _launchWebView,
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => CKCWebView(
      //       titleBar: 'CKC STUDENTS',
      //       url: categoryModel.url,
      //     ),
      //   ),
      // ),
      child: Container(
        width: 135,
        height: 135,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BlueBoxShadow],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 50,
              child: CachedNetworkImage(
                fit: BoxFit.contain,
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
            SizedBox(height: 10),
            Text(
              categoryModel.text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SFCompactDisplay-Medium',
                fontSize: 12,
              ),
              maxLines: 3,
            )
          ],
        ),
      ),
    );
  }
}
