import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      margin: EdgeInsets.only(
        top: 9, // 30 - blurRadius - offset.y
        bottom: 38,
      ),
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network('https://picsum.photos/900/500'),
      ),
    );
  }
}
