import 'package:flutter/material.dart';
import 'package:flutter_statistics_for_mario/common/app_color.dart';
import 'package:flutter_statistics_for_mario/views/input_item_common.dart';
import 'package:flutter_statistics_for_mario/data/stock_info_helper.dart';

class AddDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddDetailPageState();
}

class _AddDetailPageState extends State<AddDetailPage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _oneHandCountController = new TextEditingController();
  TextEditingController _overBoughtController = new TextEditingController();
  TextEditingController _oneHandRateController = new TextEditingController();
  TextEditingController _handCountController = new TextEditingController();
  TextEditingController _buyPriceController = new TextEditingController();
  TextEditingController _darkPriceController = new TextEditingController();
  TextEditingController _biddingPriceController = new TextEditingController();
  TextEditingController _serviceFeeController = new TextEditingController();
  TextEditingController _sellPriceController = new TextEditingController();
  TextEditingController _gainAmountController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new Container(
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
              child: new RaisedButton(
                onPressed: () {
                  _saveInput();
                },
                color: AppColor.primaryRed,
                child: new Text(
                  "保存",
                  style: new TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
          backgroundColor: AppColor.primaryBlue,
          title: new Text("新增"),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new InputItemCommonView("股票名称", "请输入", _nameController),
              new InputItemCommonView("一手股数", "请输入", _oneHandCountController),
              new InputItemCommonView("超购倍数", "请输入", _overBoughtController),
              new InputItemCommonView("中签率", "请输入", _oneHandRateController),
              new InputItemCommonView("中签数", "请输入", _handCountController),
              new InputItemCommonView("买价", "请输入", _buyPriceController),
              new InputItemCommonView("暗盘价格", "请输入", _darkPriceController),
              new InputItemCommonView("竞价盘价", "请输入", _biddingPriceController),
              new InputItemCommonView("其他费用", "请输入", _serviceFeeController),
              new InputItemCommonView("卖价", "请输入", _sellPriceController),
              new InputItemCommonView("盈利", "请输入", _gainAmountController),
            ],
          ),
        ));
  }

  _saveInput() async {
    // showloading
    StockProvider provider = new StockProvider();
    print("开始open");
    await provider.open();
    Stock stock = new Stock("测试用", 1, 2, 3, 4, 5, 6, 7, 7, 7, 7);
    print("开始插入");
    await provider.insert(stock);

    print("插入完毕");
    await provider.close();
    // hideloain
  }
}
