import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  List data;

  @override
  void initState() {
    super.initState();
    _pullNet();
  }

  void _pullNet() async {
    await http
        .get("http://www.wanandroid.com/project/list/1/json?cid=1")
        .then((http.Response response) {
      var convertDataToJson = json.decode(response.body);
      convertDataToJson = convertDataToJson["data"]["datas"];
      print(convertDataToJson);

      setState(() {
        data = convertDataToJson;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: data != null ? _getItem() : _loading(),
      ),
    );
  }

  List<Widget> _loading() {
    return <Widget>[
      new Container(
        height: 300.0,
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
              new Text("loading"),
            ],
          ),
        ),
      )
    ];
  }

  List<Widget> _getItem() {
    return data.map((item) {
      return new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: _getRowWidget(item),
        ),
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),
      );
    }).toList();
  }

  Widget _getRowWidget(item) {
    return Row(
      children: <Widget>[
        new Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: new Stack(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Text(
                    "${item["title"]}".trim(),
                    style: new TextStyle(color: Colors.black, fontSize: 20.0),
                    textAlign: TextAlign.left,
                  ),
                  new Text(
                    "${item["desc"]}",
                    maxLines: 3,
                  )
                ],
              )
            ],
          ),
        ),
        new ClipRect(
          child: new FadeInImage.assetNetwork(
            placeholder: "images/lake.jpg",
            image: "${item['envelopePic']}",
            width: 50.0,
            height: 50.0,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
