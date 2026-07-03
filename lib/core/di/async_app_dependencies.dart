import 'package:crypter/core/app/config/app_config.dart';
import 'package:crypter/core/app/contants/db_constants.dart';
import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

/// The class that avoids dealing with Riverpod-specific types such as AsyncValue.
/// Async dependencies initialized before the app launch and than the providers overridden by them.
class AsyncAppDependencies {
  final SharedPreferences _sharedPreferences;
  final Database _db;

  AsyncAppDependencies._({required this._sharedPreferences, required this._db});

  static Future<AsyncAppDependencies> init(AppConfig appConfig) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final databasesPath = await getApplicationDocumentsDirectory();
    final path = join(databasesPath.path, 'orders.db');
    final database = await openDatabase(
      path,
      version: appConfig.databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          create table ${DbConstants.tableOrders} (
            ${DbConstants.columnId} integer primary key autoincrement,
            ${DbConstants.columnNumber}  integer not null,
            ${DbConstants.columnSymbol} text not null,
            ${DbConstants.columnExchange} text not null,
            ${DbConstants.columnSide} text not null,
            ${DbConstants.columnQuantity} real not null,
            ${DbConstants.columnPrice} real not null,
            ${DbConstants.columnPlacingTime} integer not null,
            ${DbConstants.columnStatus} text not null,
            ${DbConstants.columnTakeProfit} real,
            ${DbConstants.columnStopLoss} real,
            ${DbConstants.columnClosingTime} integer,
            ${DbConstants.columnLeverage} text,
            ${DbConstants.columnMargin} real,
            ${DbConstants.columnRealizedPnL} real)
          ''');
      },
    );

    return AsyncAppDependencies._(sharedPreferences: sharedPreferences, db: database);
  }

  List<Override> get overrides => [
    sharedPreferencesProvider.overrideWithValue(_sharedPreferences),
    sqfliteProvider.overrideWithValue(_db),
  ];
}
