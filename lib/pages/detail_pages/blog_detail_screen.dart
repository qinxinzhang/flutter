import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/model/list_response_entity.dart';
import 'package:intl/intl.dart';
import 'my_webview.dart';
import 'package:logger/logger.dart';

class BlogDetailScreen extends StatefulWidget {
  ListResponseDataData _data;
  BlogDetailScreen(this._data);

  @override
  State<StatefulWidget> createState() {
    return BlogDetailState();
  }
}

class BlogDetailState extends State<BlogDetailScreen> {
  var logger = Logger();
  @override
  Widget build(BuildContext context) {
    Widget authorSection = Row(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(10.0),
            child: new Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                widget._data.author,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )),
        Text(
          DateFormat.yMMMd().format(
              DateTime.fromMillisecondsSinceEpoch(widget._data.publishTime)),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        )
      ],
    );

    Widget tagSection = new Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      height: 40,
      alignment: Alignment.topLeft,
      child: ListView.builder(
          itemCount: widget._data.tags.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctext, int index) {
            return InkWell(
              child: Card(
                child: new Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                  child: Text(widget._data.tags[index].name,
                      style: TextStyle(fontSize: 10, color: Colors.blueAccent)),
                ),
              ),
              onTap: () {
                logger.d(widget._data.tags[index].url);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebview(widget._data.tags[index].name,
                      widget._data.tags[index].url);
                }));
              },
            );
          }),
    );

    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: <Widget>[authorSection, tagSection],
        ));
  }
}
