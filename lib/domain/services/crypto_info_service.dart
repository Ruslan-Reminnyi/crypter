abstract interface class CryptoInfoService {
  Future<String> getCryptoCandlesInfo({String? symbol, String? interval, int? limit});
}
