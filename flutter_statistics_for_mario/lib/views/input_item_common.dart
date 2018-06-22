import 'package:flutter/material.dart';
import 'package:flutter_statistics_for_mario/common/app_color.dart';

class InputItemCommonView extends StatelessWidget {
  String leftTips;
  String rightHint;

  TextEditingController _controller;

  InputItemCommonView(this.leftTips, this.rightHint,this._controller);

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 50.0,
        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  width: 80.0,
                  padding: new EdgeInsets.only(right: 15.0),
                  alignment: Alignment.centerRight,
                  child: new Text(leftTips,
                      style: new TextStyle(fontSize: 14.0)),
                ),
                new Expanded(
                    child: new TextField(
                  style: new TextStyle(fontSize: 14.0, color: Colors.black),
                  controller: _controller,
                  decoration: new InputDecoration(
                      hintText: rightHint, border: InputBorder.none),
                ))
              ],
            ),
            new Container(
              color: AppColor.primaryGray,
              height: 1.0,
            ),
          ],
        ));
  }
}
