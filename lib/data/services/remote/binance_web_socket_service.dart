import 'dart:convert';

import 'package:crypter/domain/services/remote/web_socket_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@LazySingleton(as: WebSocketService)
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
  void subscribe({int id = 1, String? symbol = 'ethusdt', String? interval = '1d'}) {
    _channel.sink.add(
      jsonEncode({
        "method": "SUBSCRIBE",
        "params": ['$symbol@kline_$interval'],
        "id": id,
      }),
    );
  }

  @override
  void unsubscribe({int id = 1, String? symbol = 'ethusdt', String? interval = '1d'}) {
    _channel.sink.add(
      jsonEncode({
        "method": "UNSUBSCRIBE",
        "params": ['$symbol@kline_$interval'],
        "id": id,
      }),
    );
  }

  @override
  void close() {
    _channel.sink.close();
  }
}
