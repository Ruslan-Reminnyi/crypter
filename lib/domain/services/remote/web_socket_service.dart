abstract interface class WebSocketService {
  Stream get stream;

  void init();
  void subscribe(int id, {required String symbol, required String interval});
  void unsubscribe(int id, {required String symbol, required String interval});
  void close();
}
