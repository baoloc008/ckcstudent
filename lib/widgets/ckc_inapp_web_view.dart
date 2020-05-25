import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CKCInAppWebView extends StatefulWidget {
  final String titleBar;
  final String url;

  CKCInAppWebView({this.titleBar, this.url});

  @override
  _CKCInAppWebViewState createState() => new _CKCInAppWebViewState();
}

class _CKCInAppWebViewState extends State<CKCInAppWebView> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;
  String title = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          this.title.length > 0 ? this.title : widget.titleBar,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'SFCompactDisplay-Bold',
          ),
        ),
      ),
      body: Container(
        child: InAppWebView(
          initialUrl: widget.url,
          initialHeaders: {},
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
//                  debuggingEnabled: true,
                ),
          ),
          onWebViewCreated: (InAppWebViewController controller) async {
            webView = controller;
          },
          onLoadStart: (InAppWebViewController controller, String url) {},
          onLoadStop: (InAppWebViewController controller, String url) async {
            String _title = await webView.getTitle();
            setState(() {
              this.title = _title;
            });
          },
          onProgressChanged: (InAppWebViewController controller, int progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
        ),
      ),
    );
  }
}

//Container(
//child: progress < 1.0
//? LinearProgressIndicator(value: progress)
//: Container(),
//),
