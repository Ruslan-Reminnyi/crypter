import 'dart:convert';

import 'package:crypter/data/remote/chart_endpoints.dart';
import 'package:crypter/domain/services/remote/web_socket_service.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketService implements WebSocketService {
  final WebSocketChannel _channel;

  BinanceWebSocketService(this._channel) {
    init();
  }

  @override
  Stream get stream => _channel.stream;

  @override
  void init() {
    _channel.ready.onError<WebSocketChannelException>((e, st) {
      debugPrint('Error starting the WebSocketChannel - ${e.message}\n${e.inner}\n$st');
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
  }

  @override
  void close() {
    _channel.sink.close();
  }
}
