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
  List<Stock> stockList = [];

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
          new Expanded(
              child: new ListView.builder(
                  itemCount: stockList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Stock item = stockList[index];
                    return new StockItemView(item: item);
                  }))
        ],
      ),
    );
  }

  Future getData() async {
    StockProvider provider = new StockProvider();
    await provider.open();

    List<Stock> list = await provider.getStocks();

    if(list != null && list.length > 0){
      setState(() {
        stockList.addAll(list);
        print(stockList);
      });
    }

    provider.close();
    
  }
}

class StockItemView extends StatelessWidget {
  const StockItemView({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Stock item;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Card(
        child: new Text(item.name),
      ),
    );
  }
}
