abstract interface class LocalStorageService {
  String? get symbol;
  Future<bool> setSymbol(String symbol);
  String? get interval;
  Future<bool> setInterval(String interval);
  Future<bool> clear();
}
