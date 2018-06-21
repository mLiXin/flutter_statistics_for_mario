import 'package:flutter/material.dart';
import 'package:flutter_statistics_for_mario/common/app_color.dart';
import 'package:flutter_statistics_for_mario/data/stock_info_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class TabList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TabListState();
}

class _TabListState extends State<TabList> {
  List<Stock> stockList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Card(
            child: new Container(
              height: 200.0,
              child: new Center(
                child: new Text("测试用"),
              ),
            ),
            color: AppColor.primaryBlue,
          ),
          new Expanded(
              child: new ListView.builder(
                  itemCount: 200,
                  itemBuilder: (BuildContext context, int index) {}))
        ],
      ),
    );
  }

  Future getData() async {
    String databasePath = await getDatabasesPath();

    StockProvider provider = new StockProvider();
    await provider.open(databasePath);

    List<Stock> list = await provider.getStocks();

    setState(() {
      stockList.addAll(list);
      print(stockList);
    });
  }
}
