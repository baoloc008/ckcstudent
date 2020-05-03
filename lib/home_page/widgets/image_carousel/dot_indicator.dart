import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final List<String> imgList;
  final int currentIndex;

  const DotIndicator({Key key, this.imgList, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.map((url) {
        int index = imgList.indexOf(url);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? Theme.of(context).primaryColor
                : Color.fromRGBO(0, 0, 0, 0.1),
          ),
        );
      }).toList(),
    );
  }
}
