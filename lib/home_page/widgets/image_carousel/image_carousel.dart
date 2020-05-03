import 'package:carousel_slider/carousel_slider.dart';
import 'package:ckcstudent/home_page/widgets/image_carousel/carousel_item.dart';
import 'package:ckcstudent/home_page/widgets/image_carousel/dot_indicator.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imgList;

  ImageCarousel({this.imgList});

  @override
  State<StatefulWidget> createState() {
    return _ImageCarouselState();
  }
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 9, // 30 - blurRadius - offset.y
        bottom: 38,
      ),
      child: Column(children: [
        CarouselSlider(
          items: widget.imgList
              .map((item) => CarouselItem(imageUrl: item))
              .toList(),
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 200,
              onPageChanged: (index, reason) {
                setState(() => _current = index);
              }),
        ),
        DotIndicator(
          imgList: widget.imgList,
          currentIndex: _current,
        ),
      ]),
    );
  }
}
