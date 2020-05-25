import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class CKCWebView extends StatefulWidget {
  final String titleBar;
  final String url;

  CKCWebView({this.titleBar, this.url});

  @override
  _CKCWebViewState createState() => _CKCWebViewState();
}

class _CKCWebViewState extends State<CKCWebView> {
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

  Future<bool> _onBackPressed() async {
    if (await webView.canGoBack()) {
      await webView.goBack();
      return Future.value(false);
    }
    return Future.value(true);
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Crashlytics.instance.log('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            this.title.length > 0 ? this.title : widget.titleBar,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'SFCompactDisplay-Bold',
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close,
                size: 25,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              InAppWebView(
                initialUrl: widget.url,
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    // debuggingEnabled: true,
                    useOnDownloadStart: true,
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) async {
                  webView = controller;
                },
                onLoadStop:
                    (InAppWebViewController controller, String url) async {
                  String _title = await webView.getTitle();
                  setState(() {
                    this.title = _title;
                  });
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
                onDownloadStart:
                    (InAppWebViewController controller, String url) {
                  _launchURL(url);
                },
              ),
              Positioned(
                child: progress < 1.0
                    ? Container(
                        height: 3,
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
