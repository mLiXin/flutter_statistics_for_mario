import 'package:flutter/material.dart';

class AddDetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _AddDetailPageState();

}

class _AddDetailPageState extends State<AddDetailPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("新增页面"),
      ),
    );
  }

}