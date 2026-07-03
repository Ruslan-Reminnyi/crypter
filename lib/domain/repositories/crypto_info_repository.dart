import 'package:candlesticks/candlesticks.dart';

abstract interface class CryptoInfoRepository {
  Stream<List<Candle>> get stream;

  void subscribeToWebSocket(int id, {required String symbol, required String interval});
  void unsubscribeFromWebSocket(int id, {required String symbol, required String interval});
  void listenToWebSocketStream();
  void dispose();
}
