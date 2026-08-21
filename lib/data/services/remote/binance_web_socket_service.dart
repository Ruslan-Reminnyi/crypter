import 'dart:convert';

import 'package:crypter/data/remote/chart_endpoints.dart';
import 'package:crypter/domain/services/remote/web_socket_service.dart';
import 'package:talker/talker.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketService implements WebSocketService {
  final WebSocketChannel _channel;
  final Talker _talker;

  BinanceWebSocketService(this._channel, this._talker) {
    init();
  }

  @override
  Stream get stream => _channel.stream;

  @override
  void init() {
    _channel.ready.onError<WebSocketChannelException>((e, st) {
      _talker.error('Error starting the WebSocketChannel - ', e.inner, st);
      return;
    });
  }

  @override
  void subscribe(int id, {required String symbol, required String interval}) {
    final params = ChartEndpoints.binanceWebSocket.klineStreams(symbol, interval);
    _channel.sink.add(
      jsonEncode({
        "method": "SUBSCRIBE",
        "params": [params],
        "id": id,
      }),
    );

    _talker.info('Subscribed');
  }

  @override
  void unsubscribe(int id, {required String symbol, required String interval}) {
    final params = ChartEndpoints.binanceWebSocket.klineStreams(symbol, interval);
    _channel.sink.add(
      jsonEncode({
        "method": "UNSUBSCRIBE",
        "params": [params],
        "id": id,
      }),
    );

    _talker.info("'Unsubscribed");
  }

  @override
  void close() {
    _channel.sink.close();
  }
}
