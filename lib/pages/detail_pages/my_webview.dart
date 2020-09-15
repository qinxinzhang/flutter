import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebview extends StatelessWidget {
  String _title;
  String _url;

  MyWebview(this._title, this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: WebView(
          initialUrl: "https://www.wanandroid.com" + _url,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
