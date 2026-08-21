import 'dart:async';

import 'package:crypter/core/app/contants/db_constants.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/domain/services/local/local_database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:talker/talker.dart';

class SqfliteService implements LocalDatabaseService {
  final Database db;
  final Talker _talker;

  SqfliteService(this.db, this._talker);

  List<String> get _allColumns => [
    DbConstants.columnId,
    DbConstants.columnNumber,
    DbConstants.columnSymbol,
    DbConstants.columnExchange,
    DbConstants.columnSide,
    DbConstants.columnQuantity,
    DbConstants.columnPrice,
    DbConstants.columnPlacingTime,
    DbConstants.columnStatus,
    DbConstants.columnTakeProfit,
    DbConstants.columnStopLoss,
    DbConstants.columnClosingTime,
    DbConstants.columnLeverage,
    DbConstants.columnMargin,
    DbConstants.columnRealizedPnL,
  ];

  @override
  Future<void> create() async {
    // sqflite db is created in AsyncAppDependencies before runApp
  }

  @override
  Future<int> insertOrder(Order order) async {
    final id = await db.insert(DbConstants.tableOrders, order.toJson());

    _talker.info("Inserted an order to local DB");

    return id;
  }

  @override
  Future<void> updateOrder(Order order) async {
    await db.update(
      DbConstants.tableOrders,
      order.toJson(),
      where: '${DbConstants.columnId} = ?',
      whereArgs: [order.id],
      conflictAlgorithm: .replace,
    );

    _talker.info("Updated an order in local DB");
  }

  @override
  Future<Order> getOrder(int id) async {
    final maps = await db.query(
      DbConstants.tableOrders,
      columns: _allColumns,
      where: '${DbConstants.columnId} = ?',
      whereArgs: [id],
    );

    _talker.info("Got an order from local DB");

    return Order.fromJson(maps.first);
  }

  @override
  Future<List<Order>> getAllOrders() async {
    final maps = await db.query(DbConstants.tableOrders, columns: _allColumns);

    _talker.info("Got all orders from local DB");

    return maps.map((item) => Order.fromJson(item)).toList();
  }

  @override
  Future<void> deleteOrder(int id) async {
    await db.delete(DbConstants.tableOrders, where: '${DbConstants.columnId} = ?', whereArgs: [id]);

    _talker.info("Deleted an order from local DB");
  }

  @override
  Future<void> close() async => await db.close();
}
