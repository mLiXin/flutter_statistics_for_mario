import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statistics_for_mario/data/stock_info_helper.dart';

const double _kTextAndIconTabHeight = 53.0; // 导航高度
const double _kMarginBottom = 3.0; // 图标与文字的间隔

class CommonTab extends StatelessWidget {

  final Text text;
  final AssetImage icon;

  CommonTab({
    Key key,
    this.text,
    this.icon,
  })
      : assert(text != null || icon != null),
        super(key: key);

  Widget _buildLabelText() {
    return text;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    double height = _kTextAndIconTabHeight;
    Widget label = new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Image(
              image: icon,
              height: 20.0,
              width: 20.0,
            ),
            margin: const EdgeInsets.only(bottom: _kMarginBottom),
          ),
          _buildLabelText()
        ]
    );

    return new SizedBox(
      height: height,
      child: new Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }

}