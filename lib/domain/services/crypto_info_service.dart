abstract class CryptoInfoService {
  Future<String> getCryptoInfo({String? symbol, String? interval, int? limit});
}
