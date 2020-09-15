import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/generated/json/list_response_entity_helper.dart';
import 'package:my_flutter_app/model/list_response_entity.dart';
import 'detail_pages/blog_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  List<ListResponseDataData> data;

  @override
  void initState() {
    super.initState();
    _pullNet();
  }

  void _pullNet() async {
    Dio dio = new Dio();
    var response =
        await dio.get("http://www.wanandroid.com/project/list/1/json?cid=1");
    ListResponseEntity listResponseEntity =
        listResponseEntityFromJson(new ListResponseEntity(), response.data);

    setState(() {
      data = listResponseEntity.data.datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          itemCount: data != null ? data.length : 1,
          itemBuilder: (BuildContext ctext, int index) {
            return InkWell(
              child: data != null
                  ? _getRowWidget(data[index])
                  : new Container(
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
                    ),
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return BlogDetailScreen(data[index]);
                }));
              },
            );
          }),
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
    return Card(
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: new Stack(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Text(
                        item.title.trim(),
                        style: new TextStyle(color: Colors.black, fontSize: 20.0),
                        textAlign: TextAlign.left,
                      ),
                      new Text(
                        item.desc,
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
                image: item.envelopePic,
                width: 50.0,
                height: 50.0,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
      elevation: 3.0,
      margin: const EdgeInsets.all(10.0),
    );
  }
}
