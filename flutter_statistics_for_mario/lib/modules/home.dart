import 'package:flutter/material.dart';

import 'tab_list.dart';
import 'tab_setting.dart';
import 'package:flutter_statistics_for_mario/views/tab_common.dart';
import 'package:flutter_statistics_for_mario/common/app_color.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;
  VoidCallback onChanged;

  @override
  void initState() {
    super.initState();

    _tabController =
        new TabController(initialIndex: _currentIndex, length: 2, vsync: this);

    onChanged = () {
      setState(() {
        _currentIndex = this._tabController.index;
      });
    };

    _tabController.addListener(onChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(onChanged);
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(controller: _tabController, children: [
        new TabList(),
        new TabSetting(),
      ]),
      bottomNavigationBar: new Material(
        color: AppColor.primaryBlue,
        child: new TabBar(
          controller: _tabController,
          tabs: [
            new CommonTab(
              icon: _currentIndex == 0
                  ? new AssetImage("assets/images/ic_list_blue.png")
                  : new AssetImage("assets/images/ic_list_gray.png"),
              text: new Text(
                "列表",
                style: new TextStyle(
                    color: _currentIndex == 0
                        ? AppColor.primaryLightBlue
                        : AppColor.primaryGray),
              ),
            ),
            new CommonTab(
              icon: _currentIndex == 1
                  ? new AssetImage("assets/images/ic_setting_blue.png")
                  : new AssetImage("assets/images/ic_setting_gray.png"),
              text: new Text(
                "设置",
                style: new TextStyle(
                    color: _currentIndex == 1
                        ? AppColor.primaryLightBlue
                        : AppColor.primaryGray),
              ),
            ),
          ],
          indicatorColor: AppColor.primaryLightBlue,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: AppColor.primaryBlue,
        onPressed: () {
          //  add a new stock
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}
