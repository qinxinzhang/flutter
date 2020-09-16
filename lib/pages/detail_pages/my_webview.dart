import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebview extends StatefulWidget {
  String _title;
  String _url;

  MyWebview(this._title, this._url);

  @override
  State<StatefulWidget> createState() {
    return MyWebviewState();
  }
}

class MyWebviewState extends State<MyWebview> {
  bool _isLoadingPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget._url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                _isLoadingPage = false;
              });
            },
          ),
          _isLoadingPage
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
