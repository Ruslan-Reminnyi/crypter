import 'package:candlesticks/candlesticks.dart';

abstract interface class CryptoInfoRepo {
  Stream<List<Candle>> get stream;

  void subscribeToWebSocket({int id, String? symbol, String? interval});
  void unsubscribeFromWebSocket({int id, String? symbol, String? interval});
  void listenToWebSocketChannelStream();
  void dispose();
}
