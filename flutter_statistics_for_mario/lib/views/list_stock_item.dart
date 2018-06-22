import 'package:flutter/material.dart';
import 'package:flutter_statistics_for_mario/common/app_color.dart';
import 'package:flutter_statistics_for_mario/data/stock_info_helper.dart';

class StockItemView extends StatelessWidget {
  const StockItemView({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Stock item;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120.0,
      child: new Card(
        color:
            (item.gainAmount > 0) ? AppColor.primaryRed : AppColor.primaryGreen,
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.topLeft,
              margin: new EdgeInsets.only(left: 10.0, top: 10.0),
              child: new Text(
                item.name,
                style: new TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    "已中签数：${item.handCount}",
                    style: new TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                  new Expanded(child: new Text("")),
                  new Text("卖出价格:${item.sellPrice}",
                      style: new TextStyle(
                          color: Colors.white, fontSize: 14.0)) // todo
                ],
              ),
            ),
            new Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: new Text(
                "总盈利：${item.gainAmount}",
                style: new TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
