import 'package:cached_network_image/cached_network_image.dart';
import 'package:ckcstudent/widgets/ckc_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageViewerPage extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  final String imageUrl;

  const ImageViewerPage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PhotoView.customChild(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Container(
              child: CKCProgressIndicator(
                value: downloadProgress.progress,
              ),
            ),
            errorWidget: (context, url, error) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.error,
                  color: Theme.of(context).errorColor,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                  'Ảnh đã bị lỗi!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          minScale: PhotoViewComputedScale.contained * 0.5,
          maxScale: PhotoViewComputedScale.covered * 4,
        ),
        Positioned(
          top: 50,
          left: 10,
          child: GestureDetector(
            onTap: () => _launchURL(imageUrl),
            child: Icon(Icons.file_download, color: Colors.grey[400], size: 30),
          ),
        ),
        Positioned(
          top: 50,
          right: 10,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, color: Colors.grey[400], size: 30),
          ),
        )
      ],
    ));
  }
}
