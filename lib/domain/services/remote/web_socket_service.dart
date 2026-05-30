abstract interface class WebSocketService {
  Stream get stream;

  void init();
  void subscribe({int id, String? symbol, String? interval});
  void unsubscribe({int id, String? symbol, String? interval});
  void close();
}
