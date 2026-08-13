import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _LocalStorageKeys {
  static const String kSymbol = 'symbol';
  static const String kInterval = 'interval';
  static const String kLimit = 'limit';
  static const String kToken = 'token';
  static const String kDeviceName = 'device_name';
  static const String kFirebaseMessagingToken = 'firebase_messaging_token';
}

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
  int? get limit => _sharedPreferences.getInt(_LocalStorageKeys.kLimit);

  @override
  Future<bool> setLimit(int limit) async =>
      await _sharedPreferences.setInt(_LocalStorageKeys.kLimit, limit);

  @override
  String? get token => _sharedPreferences.getString(_LocalStorageKeys.kToken);

  @override
  Future<bool> setToken(String backendToken) async =>
      await _sharedPreferences.setString(_LocalStorageKeys.kToken, backendToken);

  @override
  Future<bool> removeToken() async => await _sharedPreferences.remove(_LocalStorageKeys.kToken);

  @override
  String? get deviceName => _sharedPreferences.getString(_LocalStorageKeys.kDeviceName);

  @override
  Future<bool> setDeviceName(String userDevice) async =>
      await _sharedPreferences.setString(_LocalStorageKeys.kDeviceName, userDevice);

  @override
  String? get firebaseMessagingToken =>
      _sharedPreferences.getString(_LocalStorageKeys.kFirebaseMessagingToken);

  @override
  Future<bool> setFirebaseMessagingToken(String firebaseMessagingToken) async =>
      await _sharedPreferences.setString(
        _LocalStorageKeys.kFirebaseMessagingToken,
        firebaseMessagingToken,
      );

  @override
  Future<bool> clear() async => await _sharedPreferences.clear();
}
