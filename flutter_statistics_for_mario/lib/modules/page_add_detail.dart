import 'package:flutter/material.dart';
import 'package:flutter_statistics_for_mario/common/app_color.dart';
import 'package:flutter_statistics_for_mario/views/input_item_common.dart';

class AddDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddDetailPageState();
}

class _AddDetailPageState extends State<AddDetailPage> {

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: AppColor.primaryBlue,
          title: new Text("新增"),
        ),
        body: new Column(
          children: <Widget>[
            new InputItemCommonView("股票名称", "请输入",_nameController),
            new InputItemCommonView("买价", "请输入",_priceController)
          ],
        ));
  }
}
