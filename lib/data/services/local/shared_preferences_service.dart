import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _LocalStorageKeys {
  static const String kSymbol = 'symbol';
  static const String kInterval = 'interval';
}

@Singleton(as: LocalStorageService)
class SharedPreferencesService implements LocalStorageService {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesService(this._sharedPreferences);

  @override
  String? get symbol => _sharedPreferences.getString(_LocalStorageKeys.kSymbol);

  @override
  Future<bool> setSymbol(String symbol) async =>
      await _sharedPreferences.setString(_LocalStorageKeys.kSymbol, symbol);

  @override
  String? get interval => _sharedPreferences.getString(_LocalStorageKeys.kInterval);

  @override
  Future<bool> setInterval(String interval) async =>
      await _sharedPreferences.setString(_LocalStorageKeys.kInterval, interval);

  @override
  Future<bool> clear() async => await _sharedPreferences.clear();
}
