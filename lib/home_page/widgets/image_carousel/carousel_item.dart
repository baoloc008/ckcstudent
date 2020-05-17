import 'package:cached_network_image/cached_network_image.dart';
import 'package:ckcstudent/image_viewer_page/image_viewer_page.dart';
import 'package:ckcstudent/widgets/ckc_progress_indicator.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String imageUrl;
  final String fullImageUrl;
  final int currentIndex;

  const CarouselItem(
      {Key key, this.imageUrl, this.currentIndex, this.fullImageUrl})
      : super(key: key);

  void launchImageViewer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewerPage(
          imageUrl: fullImageUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color placeHolderColor = Theme.of(context).dividerColor;
    Color errorColor = Theme.of(context).errorColor;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 200,
          width: 200 * 16 / 9,
          child: GestureDetector(
            onTap: () => launchImageViewer(context),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Container(
                decoration: BoxDecoration(color: placeHolderColor),
                child: CKCProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(color: placeHolderColor),
                child: Icon(
                  Icons.error,
                  color: errorColor,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
