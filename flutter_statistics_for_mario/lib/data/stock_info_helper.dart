import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';

final String tableStock = "stock_list";
final String columnId = "_id";
final String columnName = "_name";
final String columnBuyPrice = "_buy_price";
final String columnSellPrice = "_sell_price";
final String columnOneHandCount = "_one_hand_count";
final String columnHandCount = "_hand_count";
final String columnServiceFee = "_service_fee";
final String columnGainAmount = "_gain_amount";

// feat add
final String columnOneHandRate = "_one_hand_rate";
final String columnOverBought = "_over_bought";
final String columnBiddingPrice = "_bidding_price";
final String columnDarkPrice = "_dark_price";

class Stock {
  int id;
  String name;
  int buyPrice; // 买价 分
  int sellPrice; // 卖价 分
  int oneHandCount; // 一手多少股
  int handCount; // 中了多少手
  int serviceFee; // 其他费用 分
  int gainAmount; // 总盈利 分

  // feat add
  int oneHandRate; // 一手中签率
  int overBought; // 超购倍数
  int biddingPrice; // 竞价盘价格 分
  int darkPrice; // 暗盘价格 分

  Stock(
      this.id,
      this.name,
      this.buyPrice,
      this.sellPrice,
      this.oneHandCount,
      this.handCount,
      this.serviceFee,
      this.gainAmount,
      this.oneHandRate,
      this.overBought,
      this.biddingPrice,
      this.darkPrice);

  Map toMap() {
    Map map = {
      columnName: name,
      columnBuyPrice: buyPrice,
      columnSellPrice: sellPrice,
      columnOneHandCount: oneHandCount,
      columnHandCount: handCount,
      columnServiceFee: serviceFee,
      columnGainAmount: gainAmount,

      //feat add
      columnOneHandRate: oneHandRate,
      columnOverBought: overBought,
      columnBiddingPrice: biddingPrice,
      columnDarkPrice: darkPrice
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Stock.fromMap(Map map) {
    id = map[columnId];
    name = map[columnName];
    buyPrice = map[columnBuyPrice];
    sellPrice = map[columnSellPrice];
    oneHandCount = map[columnOneHandCount];
    handCount = map[columnHandCount];
    serviceFee = map[columnServiceFee];
    gainAmount = map[columnGainAmount];

    // feat add
    oneHandRate = map[columnOneHandRate];
    overBought = map[columnOverBought];
    biddingPrice = map[columnBiddingPrice];
    darkPrice = map[columnDarkPrice];
  }
}

class StockProvider {
  Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
      create table $tableStock (
        $columnId integer primary key autoincrement,
        $columnName text not null,
        $columnBuyPrice integer,
        $columnSellPrice integer,
        $columnOneHandCount integer,
        $columnHandCount integer,
        $columnServiceFee integer,
        $columnGainAmount integer,
        $columnOneHandRate integer,
        $columnOverBought integer,
        $columnBiddingPrice integer,
        $columnDarkPrice integer
      )
      """);
    });
  }

  Future<Stock> insert(Stock stock) async {
    stock.id = await db.insert(tableStock, stock.toMap());
    return stock;
  }

  Future<Stock> getStock(int id) async {
    List<Map> maps =
        await db.query(tableStock, where: "$columnId = ?", whereArgs: [id]);
    if (maps.length > 0) {
      return new Stock.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Stock>> getStocks() async {
    List<Map> maps = await db.query(tableStock);
    if (maps.length > 0) {
      List<Stock> stockList = new List();
      for (int i = 0; i < maps.length; i++) {
        stockList.add(Stock.fromMap(maps[i]));
      }
      return stockList;
    }
    return null;
  }
}
