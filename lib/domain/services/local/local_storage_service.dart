abstract interface class LocalStorageService {
  String? get symbol;
  Future<bool> setSymbol(String symbol);
  String? get interval;
  Future<bool> setInterval(String interval);
  int? get limit;
  Future<bool> setLimit(int limit);
  String? get token;
  Future<bool> setToken(String backendToken);
  Future<bool> removeToken();
  String? get deviceName;
  Future<bool> setDeviceName(String userDevice);
  String? get firebaseMessagingToken;
  Future<bool> setFirebaseMessagingToken(String firebaseMessagingToken);
  Future<bool> clear();
}
