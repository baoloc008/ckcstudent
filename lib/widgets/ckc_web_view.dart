import 'package:ckcstudent/widgets/ckc_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';


class CKCWebView extends StatefulWidget {
  final String titleBar;
  final String url;

  CKCWebView({this.titleBar, this.url});

  @override
  _CKCWebViewState createState() => _CKCWebViewState();
}

class _CKCWebViewState extends State<CKCWebView> {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      withJavascript: true,
      withZoom: false,
      hidden: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.titleBar,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'SFCompactDisplay-Bold',
          ),
        ),
      ),
      initialChild: CKCProgressIndicator(),
    );
  }

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if ([".pdf", ".docs", ".doc", ".xlsx", ".xls"].any((element) => url.endsWith(element))) {
        _launchURL(url);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.dispose();
  }
}
