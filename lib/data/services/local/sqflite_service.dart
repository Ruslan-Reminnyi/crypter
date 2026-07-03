import 'dart:async';

import 'package:crypter/core/app/contants/db_constants.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/domain/services/local/local_database_service.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteService implements LocalDatabaseService {
  final Database db;

  SqfliteService(this.db);

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
  Future<int> insert(Order order) async => await db.insert(DbConstants.tableOrders, order.toJson());

  @override
  Future<void> update(Order order) async => await db.update(
    DbConstants.tableOrders,
    order.toJson(),
    where: '${DbConstants.columnId} = ?',
    whereArgs: [order.id],
    conflictAlgorithm: .replace,
  );

  @override
  Future<Order> get(int id) async {
    final maps = await db.query(
      DbConstants.tableOrders,
      columns: _allColumns,
      where: '${DbConstants.columnId} = ?',
      whereArgs: [id],
    );

    return Order.fromJson(maps.first);
  }

  @override
  Future<List<Order>> getAll() async {
    final maps = await db.query(DbConstants.tableOrders, columns: _allColumns);

    return maps.map((item) => Order.fromJson(item)).toList();
  }

  @override
  Future<void> delete(int id) async => await db.delete(
    DbConstants.tableOrders,
    where: '${DbConstants.columnId} = ?',
    whereArgs: [id],
  );

  @override
  Future<void> close() async => await db.close();
}
