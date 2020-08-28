import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EachView extends StatefulWidget{
  String _title;
  EachView(this._title);
  @override
  State<StatefulWidget> createState() => _EachViewState();
}
class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }

}