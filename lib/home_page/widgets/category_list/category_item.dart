import 'package:ckcstudent/models/app_config.dart';
import 'package:ckcstudent/widgets/general/box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  CategoryItem({this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebviewScaffold(
            url: categoryModel.url,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'CKC STUDENTS',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SFCompactDisplay-Bold',
                ),
              ),
            ),
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
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: categoryModel.icon,
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
