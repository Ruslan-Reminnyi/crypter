import 'package:crypter/core/app/config/app_config.dart';
import 'package:crypter/core/app/contants/db_constants.dart';
import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:talker/talker.dart';

/// The class that avoids dealing with Riverpod-specific types such as AsyncValue.
/// Async dependencies initialized before the app launch and than the providers overridden by them.
class AppAsyncOverrides {
  final SharedPreferences _sharedPreferences;
  final Database _db;

  AppAsyncOverrides._({required this._sharedPreferences, required this._db});

  static Future<AppAsyncOverrides> init(AppConfig appConfig, Talker talker) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final databaseName = 'orders.db';
    final databaseVersion = appConfig.databaseVersion;

    final query =
        '''
          create table ${DbConstants.tableOrders} (
            ${DbConstants.columnId} integer primary key,
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
          ''';

    final databaseOptions = OpenDatabaseOptions(
      version: databaseVersion,
      onCreate: (db, version) async => await db.execute(query),
    );

    Database database;

    if (kIsWeb) {
      final webFactory = databaseFactoryFfiWeb;
      final path = databaseName;

      database = await webFactory.openDatabase(path, options: databaseOptions);

      if (kDebugMode) {
        final sqliteVersion = (await database.rawQuery(
          'select sqlite_version()',
        )).first.values.first;
        talker.debug('Sqlite version - $sqliteVersion'); // 3.51.1
      }
    } else {
      final ioFactory = databaseFactory;
      final directoryPath = await getApplicationDocumentsDirectory();
      final path = join(directoryPath.path, databaseName);

      database = await ioFactory.openDatabase(path, options: databaseOptions);
    }

    return AppAsyncOverrides._(sharedPreferences: sharedPreferences, db: database);
  }

  List<Override> get overrides => [
    sharedPreferencesProvider.overrideWithValue(_sharedPreferences),
    sqfliteProvider.overrideWithValue(_db),
  ];
}
