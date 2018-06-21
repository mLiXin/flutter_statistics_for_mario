import 'package:flutter/material.dart';
import 'package:flutter_statistics_for_mario/common/app_color.dart';

class TabList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TabListState();
}

class _TabListState extends State<TabList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Card(
            child: new Container(
              height:200.0,
              child: new Center(
                child: new Text("测试用"),
              ),
            ),
            color: AppColor.primaryBlue,

          ),
          new Expanded(child: new ListView.builder(
              itemCount: 200,
              itemBuilder: (BuildContext context,int index){


          }))
        ],
      ),
    );
  }
}
